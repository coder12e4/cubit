part of 'forgot_password_cubit.dart';

@immutable
abstract class ForgotPasswordState {}

class ForgotPasswordIntial extends ForgotPasswordState {}

class ForgotPasswordLoading extends ForgotPasswordState {}

class ForgotPassworRequestdSuccessfull extends ForgotPasswordState {
  final String successMessage;

  ForgotPassworRequestdSuccessfull(this.successMessage);
}

class ForgotPassworRequestdSuccessfullyWithEmail extends ForgotPasswordState {
  final String successMessage;

  ForgotPassworRequestdSuccessfullyWithEmail(this.successMessage);
}

class ForgotPassworRequestFailed extends ForgotPasswordState {
  final String? error;

  ForgotPassworRequestFailed(this.error);
}

class ForgotPasswordVerificationLoading extends ForgotPasswordState {}

class ForgotPasswordVerificationSuccessfull extends ForgotPasswordState {
  final String successMessage;

  ForgotPasswordVerificationSuccessfull(this.successMessage);
}

class ForgotPasswordVerificationFailed extends ForgotPasswordState {
  final String? error;

  ForgotPasswordVerificationFailed(this.error);
}
