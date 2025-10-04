import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hash/hash.dart';

class ApiConfig {
  // Çevresel değişkenlerden yüklenen ayarlar
  // (dotenv paketini kullanarak .env dosyasından)
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String siteUrl = dotenv.env['SITE_URL'] ?? '';
  final String getIllerApiUrl = dotenv.env['GET_ILLER_API_URL'] ?? '';
  // Cloudflare/çerez desteği (opsiyonel)
  final String cfClearance = dotenv.env['CF_CLEARANCE'] ?? '';
  final String cookieConsent = dotenv.env['COOKIE_CONSENT'] ?? '';
  final String apiKeyMain = dotenv.env['API_KEY_MAIN'] ?? '';

  // 2025 Mobil anahtarları (hash'li veya düz değer kabul eder)
  // Öncelik: HASH değer -> yoksa PLAIN değerden runtime'da üret
  String get apiKeyMainHashed => _resolveHashed(
        hashed: dotenv.env['API_KEY_MAIN_HASHED'],
        plain: dotenv.env['API_KEY_MAIN'],
      );
  String get apiKeyIosHashed => _resolveHashed(
        hashed: dotenv.env['API_KEY_IOS_HASHED'],
        plain: dotenv.env['API_KEY_IOS'],
      );
  String get apiKeyAndroidHashed => _resolveHashed(
        hashed: dotenv.env['API_KEY_ANDROID_HASHED'],
        plain: dotenv.env['API_KEY_ANDROID'],
      );

  String _resolveHashed({String? hashed, String? plain}) {
    final String h = (hashed ?? '').trim();
    if (h.isNotEmpty) return h;
    final String p = (plain ?? '').trim();
    if (p.isEmpty) return '';
    return _mobileHash(p);
  }

  String _mobileHash(String originalKey) {
    final firstHashHex = sha256.convert(utf8.encode(originalKey)).toString();
    return sha256.convert(utf8.encode('${firstHashHex}_mobile_hash')).toString();
  }

  // Base URL normalizasyonu: trailing slash garanti
  String get mobileBase => baseUrl.trim().isEmpty
      ? ''
      : (baseUrl.trim().endsWith('/') ? baseUrl.trim() : '${baseUrl.trim()}/');

  // Yardımcı: endpoint yolunu mobileBase ile birleştir
  String endpoint(String path) {
    final String clean = path.startsWith('/') ? path.substring(1) : path;
    return '$mobileBase$clean';
  }

  // Singleton pattern (isteğe bağlı)
  static final ApiConfig instance = ApiConfig._internal();
  factory ApiConfig() => instance;
  ApiConfig._internal();
}
