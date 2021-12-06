part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoding extends LoginState {}

class LoginSuccess extends LoginState {
  final String? name;
  final String? image;
  final String? phoneno;

  LoginSuccess(this.name, this.image, this.phoneno);
}

class LoginFail extends LoginState {}
