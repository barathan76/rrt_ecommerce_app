part of 'user_profile_bloc.dart';

sealed class UserProfileEvent {}

class LoadUserProfileEvent extends UserProfileEvent {}

class UpdateUserProfileEvent extends UserProfileEvent {
  UserProfile userProfile;
  UpdateUserProfileEvent({required this.userProfile});
}
