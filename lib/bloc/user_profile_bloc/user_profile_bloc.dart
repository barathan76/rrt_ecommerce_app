import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc() : super(UserProfileInitial()) {
    UserRepo userRepo = UserRepoService();
    on<LoadUserProfileEvent>((event, emit) async {
      emit(UserProfileLoading());
      try {
        UserProfile userProfile = await userRepo.getUserProfile();
        emit(UserProfileSuccess(userProfile: userProfile));
      } on UserRepoError catch (e) {
        emit(UserProfileFailure(message: e.message));
      }
    });

    on<UpdateUserProfileEvent>((event, emit) async {
      try {
        await userRepo.updateUserProfile(event.userProfile);
      } on UserRepoError catch (e) {
        emit(UserProfileFailure(message: e.message));
      }
    });
  }
}
