import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';
  final String apiKey = dotenv.env['API_KEY'] ?? '';
  final String getIllerApiUrl = dotenv.env['GET_ILLER_API_URL'] ?? '';
  // Cloudflare koruması varsa geçici olarak çerezleri .env'den al
  final String cfClearance = dotenv.env['CF_CLEARANCE'] ?? '';
  final String cookieConsent = dotenv.env['COOKIE_CONSENT'] ?? '';

  // Singleton pattern (isteğe bağlı)
  static final ApiConfig instance = ApiConfig._internal();
  factory ApiConfig() => instance;
  ApiConfig._internal();
}
