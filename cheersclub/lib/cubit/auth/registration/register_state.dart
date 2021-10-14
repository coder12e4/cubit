part of 'register_cubit.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class RegistrationLoading extends RegisterState {}

class RegistrationLoginSuccessFull extends RegisterState {
  //save user data
}

class RegistrationFailed extends RegisterState {
  //show error
  final String msg;
  RegistrationFailed(this.msg);
}
