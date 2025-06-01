import 'package:user_repository/src/model/user_profile.dart';

abstract class UserRepo {
  Future<UserProfile> getUserProfile();
  Future<void> updateUserProfile(UserProfile userProfile);
}
