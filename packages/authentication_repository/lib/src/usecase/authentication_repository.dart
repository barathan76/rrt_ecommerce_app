abstract class AuthenticationRepository {
  Future<bool> login(String email, String password);
  Future<bool> register(String email, String password);
  Future<bool> isLoggedIn();
  Future<String?> getToken();
  Future<void> logout();
}
