import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_randevu/core/api/api_config.dart';
import 'package:my_randevu/core/models/il_model.dart';

class ApiService {
  static final config = ApiConfig();

  /// İller listesini API'den çeker. Başarılıysa List<Il>, değilse boş liste döner.
  static Future<List<Il>> getProvinces() async {
    final String url = (config.getIllerApiUrl).trim();
    if (url.isEmpty) {
      throw Exception(
        'GET_ILLER_API_URL tanımlı değil veya boş. .env ayarlarını kontrol edin.',
      );
    }

    // Browser benzeri başlıkları hazırla
    final Map<String, String> headers = {
      'Accept': 'application/json',
      'Accept-Language': 'tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7',
      'Accept-Encoding': 'gzip',
      'Cache-Control': 'no-cache',
      'Pragma': 'no-cache',
      'User-Agent':
          'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36',
      'X-Requested-With': 'XMLHttpRequest',
      'X-API-Key': config.apiKey,
    };
    final String apiKey = (config.apiKey).trim();
    if (apiKey.isNotEmpty) {
      // Sunucu X-API-Key bekliyorsa gönder; boşsa hiç göndermeyelim
      headers['X-API-Key'] = apiKey;
    }
    final String referer = (config.baseUrl).trim();
    if (referer.isNotEmpty) {
      headers['Referer'] = referer.endsWith('/')
          ? '${referer}randevual'
          : '$referer/randevual';
    } else {
      headers['Referer'] = 'https://myrandevu.com/randevual';
    }

    // Ek başlıklar: Origin ve çerezler (Cloudflare uyumu)
    headers['Origin'] = 'https://myrandevu.com';
    final List<String> cookieParts = [];
    final String cookieConsent = (ApiService.config.cookieConsent).trim();
    final String cfClearance = (ApiService.config.cfClearance).trim();
    if (cookieConsent.isNotEmpty)
      cookieParts.add('cookie_consent=$cookieConsent');
    if (cfClearance.isNotEmpty) cookieParts.add('cf_clearance=$cfClearance');
    if (cookieParts.isNotEmpty) {
      headers['Cookie'] = cookieParts.join('; ');
    }

    // Cache-buster: web çağrısındaki t=timestamp parametresini ekle
    final Uri baseUri = Uri.parse(url);
    final Map<String, String> query = Map.of(baseUri.queryParameters);
    query['t'] = DateTime.now().millisecondsSinceEpoch.toString();
    final Uri uri = baseUri.replace(queryParameters: query);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final dynamic decoded = json.decode(utf8.decode(response.bodyBytes));

      List<dynamic> extractList(dynamic raw) {
        if (raw is List) return raw;
        if (raw is Map<String, dynamic>) {
          // Yaygın zarf yapıları
          final candidates = ['data', 'iller', 'results', 'items'];
          for (final key in candidates) {
            final dynamic value = raw[key];
            if (value is List) return value;
          }
          // success=false ise hata mesajını yüzeye çıkar
          if (raw['success'] == false) {
            final message = raw['message']?.toString() ?? 'Bilinmeyen hata';
            throw Exception('İller verisi başarısız: $message');
          }
        }
        throw Exception('Beklenmeyen cevap formatı. Liste bulunamadı.');
      }

      final List<dynamic> list = extractList(decoded);
      return list
          .whereType<dynamic>()
          .map((item) => Il.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList();
    } else {
      final bodyPreview = response.body.isNotEmpty
          ? response.body.substring(0, response.body.length.clamp(0, 300))
          : '';
      throw Exception(
        'İller verisi alınamadı. Durum kodu: ${response.statusCode}. Gövde: $bodyPreview',
      );
    }
  }
}
