import 'package:authentication_repository/src/exception/auth_exception.dart';
import 'package:authentication_repository/src/service/device_info.dart';
import 'package:storage_repository/storage_repository.dart';

import '../usecase/authentication_repository.dart';
import 'package:api_repository/api_repository.dart';

class UserAuthentication implements AuthenticationRepository {
  ApiAuth apiService = ApiAuthService();
  StorageRepo storageRepo = StorageRepoService();

  @override
  Future<bool> isLoggedIn() async {
    final token = await storageRepo.getToken();
    return token != null;
  }

  @override
  Future<bool> login(String email, String password) async {
    final String device = await deviceId();
    final ResponseEntity response = await apiService.loginService(
      email,
      password,
      device,
    );

    if (response.statusCode == 200) {
      storageRepo.setToken(response.body);
      return true;
    } else if (response.statusCode == 401) {
      throw AuthException(response.body);
    }
    throw AuthException('Login Failed');
  }

  @override
  Future<bool> register(String email, String password) async {
    final String device = await deviceId();
    final ResponseEntity response = await apiService.registerService(
      email,
      password,
      device,
    );
    if (response.statusCode == 200) {
      storageRepo.setToken(response.body);
      return true;
    } else if (response.statusCode == 409) {
      throw AuthException(response.body);
    }
    throw AuthException('Register Failed');
  }

  @override
  Future<void> logout() async {
    final String? token = await storageRepo.getToken();
    final ResponseEntity response = await apiService.logoutService(token!);
    if (response.statusCode == 200) {
      await storageRepo.removeToken();
    } else {
      throw AuthException('Logout failed');
    }
  }
}
