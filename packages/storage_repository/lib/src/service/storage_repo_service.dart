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
