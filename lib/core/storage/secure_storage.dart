import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final storage = FlutterSecureStorage();
  static Future<void> saveAccessToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  static Future<void> saveREfreshToken(String token) async {
    await storage.write(key: 'access_token', value: token);
  }

  static Future<String?> getAccessToken() async {
    String? token = await storage.read(key: 'access_token');
    return token;
  }

  static Future<String?> getRefreshToken() async {
    String? token = await storage.read(key: 'access_token');
    return token;
  }

  static Future<void> deleteTokens() async {
    await storage.deleteAll();
  }
}
