import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class TokenStorage {
  static const String _tokenKey = 'auth_token';

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  String? _memoryToken;

  Future<void> saveToken(String token, {required bool persist}) async {
    _memoryToken = token;
    print('DEBUG saveToken persist=$persist');
    if (persist) {
      await _storage.write(key: _tokenKey, value: token);
    } else {
      await _storage.delete(key: _tokenKey);
    }
  }

  Future<String?> getToken() async {
    final value = _memoryToken ?? await _storage.read(key: _tokenKey);
    print('DEBUG getToken -> ${value != null ? "found" : "null"}');
    return value;
  }

  Future<void> clearToken() async {
    _memoryToken = null;
    await _storage.delete(key: _tokenKey);
  }
}