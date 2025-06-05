import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authentication_repository/authentication_repository.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    AuthenticationRepository authRepo = UserAuthentication();
    on<AuthEvent>((event, emit) {});

    on<AuthCheckAuthStatusEvent>((event, emit) async {
      bool condition = await authRepo.isLoggedIn();
      if (condition) {
        emit(AuthAuthenticated());
      } else {
        emit(AuthUnAuthenticated());
      }
    });

    on<AuthLoginRequestEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        bool condition = await authRepo.login(event.email, event.password);

        if (condition) {
          emit(AuthAuthenticated());
        }
      } on AuthFailure catch (e) {
        emit(AuthFailure(e.body));
      } catch (e) {
        print(e);
        emit(AuthFailure('Unable to connect'));
      }
    });
    on<AuthLogoutRequestEvent>((event, emit) async {
      try {
        await authRepo.logout();
        emit(AuthUnAuthenticated());
      } on AuthFailure catch (e) {
        emit(AuthLogoutFailure(e.body));
      }
    });
    on<AuthRegisterRequestEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        bool condition = await authRepo.register(event.email, event.password);
        if (condition) {
          emit(AuthAuthenticated());
        }
      } on AuthFailure catch (e) {
        emit(AuthFailure(e.body));
      } catch (e) {
        emit(AuthFailure('Unable to connect'));
      }
    });
  }
}
