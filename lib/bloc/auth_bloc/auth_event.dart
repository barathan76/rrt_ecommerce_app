part of 'auth_bloc.dart';

sealed class AuthEvent {}

final class AuthCheckAuthStatusEvent extends AuthEvent {}

final class AuthLoginRequestEvent extends AuthEvent {
  final String email;
  final String password;
  AuthLoginRequestEvent({required this.email, required this.password});
}

final class AuthRegisterRequestEvent extends AuthEvent {
  final String email;
  final String password;
  AuthRegisterRequestEvent({required this.email, required this.password});
}

final class AuthLogoutRequestEvent extends AuthEvent {}

final class AuthOnLoginEvent extends AuthEvent {}

final class AuthOnRegisterEvent extends AuthEvent {}
