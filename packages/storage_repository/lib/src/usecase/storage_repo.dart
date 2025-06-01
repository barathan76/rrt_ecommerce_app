abstract class StorageRepo {
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<void> removeToken();
}
