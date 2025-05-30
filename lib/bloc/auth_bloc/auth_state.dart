part of 'auth_bloc.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthAuthenticated extends AuthState {}

final class AuthUnAuthenticated extends AuthState {}

final class AuthFailure extends AuthState {
  final String body;
  AuthFailure(this.body);
}

final class AuthLogoutFailure extends AuthState {
  final String body;
  AuthLogoutFailure(this.body);
}
