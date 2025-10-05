import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage_repository/src/usecase/storage_repo.dart';

class StorageRepoService implements StorageRepo {
  static StorageRepoService? _instance;

  StorageRepoService._internal();

  factory StorageRepoService() {
    _instance ??= StorageRepoService._internal();
    return _instance!;
  }
  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('user')) {
      if (_isTokenExpired(prefs.getString('user')!.split(' ').last)) {
        await removeToken();
        return null;
      }
      return '${prefs.getString('user')}';
    }
    return null;
  }

  @override
  Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', 'Bearer $token');
  }

  @override
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
  }
}

bool _isTokenExpired(String token) {
  try {
    final parts = token.split('.');
    if (parts.length != 3) return true;

    final payload = json.decode(
      utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
    );
    final exp = payload['exp'];
    if (exp == null) return true;

    final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    return DateTime.now().isAfter(expiryDate);
  } catch (e) {
    return true;
  }
}
