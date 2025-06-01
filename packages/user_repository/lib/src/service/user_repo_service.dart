import 'package:api_repository/api_repository.dart'
    show ApiError, ApiUser, ApiUserService;
import 'package:user_repository/src/exception/user_exception.dart';
import 'package:user_repository/src/model/user_profile.dart';
import 'package:user_repository/src/usecase/user_repo.dart';

class UserRepoService implements UserRepo {
  ApiUser apiUser = ApiUserService();

  @override
  Future<UserProfile> getUserProfile() async {
    try {
      final result = await apiUser.getUserProfile();
      return UserProfile.fromMap(result);
    } on ApiError catch (e) {
      throw UserRepoError(message: e.message);
    }
  }

  @override
  Future<void> updateUserProfile(UserProfile userProfile) async {
    try {
      await apiUser.updateUserProfile(userProfile.toMap());
    } on ApiError catch (e) {
      throw UserRepoError(message: e.message);
    }
  }
}
