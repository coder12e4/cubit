part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class DistrictsLoading extends RegistrationState {}

class DistrictsFetchedSuccessfully extends RegistrationState {
  final List<District> districts;

  DistrictsFetchedSuccessfully(this.districts);
}

class DistrictsFetchFailed extends RegistrationState {
  final String? error;

  DistrictsFetchFailed(this.error);
}

class UserRegistrationInitial extends RegistrationState {}

class UserRegistrationCompleted extends RegistrationState {}

class UserRegistrationInProgresss extends RegistrationState {}

class RegitserUser extends RegistrationState {}

class UserRegistrationError extends RegistrationState {
  final String? error;

  UserRegistrationError(this.error);
}

class InvalidPartnerCodeError extends RegistrationState {
  final String errorMessage;
  InvalidPartnerCodeError(this.errorMessage);
}

class UserMobileVeificationInitial extends RegistrationState {}

class UserMobileVeificationInProgress extends RegistrationState {}

class UserMobileVeificationSuccess extends RegistrationState {}

class UserMobileVeificationError extends RegistrationState {
  final String? error;
  UserMobileVeificationError(this.error);
}
