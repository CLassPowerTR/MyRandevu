import 'dart:convert';
import 'dart:io' show Platform;
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'package:my_randevu/core/api/api_config.dart';
import 'package:my_randevu/core/models/il_model.dart';
import 'package:my_randevu/core/models/isletme_detay.dart';
import 'package:my_randevu/core/models/isletmeler_model.dart';

class ApiService {
  static final config = ApiConfig();
  static final http.Client _client = http.Client();

  // Hash'lenmiş API key
  static String getApiKey() {
    String originalKey = config.apiKeyMain;
    return sha256.convert(utf8.encode(originalKey)).toString();
  }

  static Future<List<Il>> getIller() async {
    final response = await http.post(
      Uri.parse(config.baseUrl + '/get_iller.php'),
      headers: {
        'Accept-Language': 'tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7',
        'Accept': 'application/json',
        'X-API-Key': getApiKey(),
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final dynamic decoded = json.decode(response.body);

      List<dynamic> list;
      if (decoded is List) {
        list = decoded;
      } else if (decoded is Map<String, dynamic>) {
        // Yaygın zarf anahtarlarını sırayla dene
        final candidates = ['data', 'iller', 'results', 'items'];
        List<dynamic>? extracted;
        for (final key in candidates) {
          final v = decoded[key];
          if (v is List) {
            extracted = v;
            break;
          }
        }
        if (extracted == null) {
          // success=false gibi durumları mesajla yüzeye çıkar
          if (decoded['success'] == false) {
            final msg = decoded['message']?.toString() ?? 'Bilinmeyen hata';
            throw Exception('İller verisi başarısız: $msg');
          }
          throw Exception('Beklenmeyen cevap formatı, liste bulunamadı.');
        }
        list = extracted;
      } else {
        throw Exception('Beklenmeyen cevap formatı.');
      }

      return list
          .map((item) => Il.fromJson(Map<String, dynamic>.from(item as Map)))
          .toList();
    } else {
      throw Exception(
        'İller isteği başarısız... Kod: ${response.statusCode} ${response}  ${response.body.isNotEmpty ? response.body.substring(0, response.body.length.clamp(0, 300)) : ''}',
      );
    }
  }

  static Future<List<Isletme>> getBusiness(int subeID) async {
    final response = await http.post(
      Uri.parse(config.baseUrl + '/get_isletmeler.php?il_id=${subeID}'),
      headers: {
        'Accept-Language': 'tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7',
        'Accept': 'application/json',
        'X-API-Key': getApiKey(),
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      IsletmelerResponse responseModel = IsletmelerResponse.fromJson(
        json.decode(response.body),
      );
      return responseModel.data.map((json) => json).toList();
    } else {
      throw Exception(
        'İller isteği başarısız... Kod: ${response.statusCode} ${response}  ${response.body.isNotEmpty ? response.body.substring(0, response.body.length.clamp(0, 300)) : ''}',
      );
    }
  }

  static Future<IsletmeDetayData> getBusinessDetail(
    int isletmeID, {
    int? subeID,
  }) async {
    String url = subeID != null
        ? config.baseUrl +
              '/get_isletme_detay.php?isletme_id=${isletmeID}&sube_id=${subeID}'
        : config.baseUrl + '/get_isletme_detay.php?isletme_id=${isletmeID}';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Accept-Language': 'tr-TR,tr;q=0.9,en-US;q=0.8,en;q=0.7',
        'Accept': 'application/json',
        'X-API-Key': getApiKey(),
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      IsletmeDetayResponse responseModel = IsletmeDetayResponse.fromJson(
        json.decode(response.body),
      );
      return responseModel.data;
    } else {
      throw Exception(
        'İller isteği başarısız... Kod: ${response.statusCode} ${response}  ${response.body.isNotEmpty ? response.body.substring(0, response.body.length.clamp(0, 300)) : ''}',
      );
    }
  }
}
