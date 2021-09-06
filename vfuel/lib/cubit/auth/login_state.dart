part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginIntial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccessfull extends LoginState {
  final UserSession userSession;
  LoginSuccessfull(this.userSession);
}

class LoginFailed extends LoginState {
  final String? error;

  LoginFailed(this.error);
}
