abstract class ApiUser {
  Future<Map<String, dynamic>> getUserProfile();
  Future<void> updateUserProfile(Map<String, dynamic> userProfile);
}
