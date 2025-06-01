part of 'user_profile_bloc.dart';

sealed class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileSuccess extends UserProfileState {
  UserProfile userProfile;
  UserProfileSuccess({required this.userProfile});
}

class UserProfileFailure extends UserProfileState {
  String message;
  UserProfileFailure({required this.message});
}

class UserProfileUpdated extends UserProfileState {}
