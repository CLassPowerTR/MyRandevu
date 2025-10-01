part of '../splash_screen.dart';

/// .env dosyasını yükler. Başarılıysa true döner.
Future<bool> _loadEnvFile({String fileName = '.env'}) async {
  try {
    await dotenv.load(fileName: fileName);
    return true;
  } catch (e, st) {
    // Hata bilgisini logla ki nedenini gör
    print('dotenv load error: $e\n$st');
    return false;
  }
}
