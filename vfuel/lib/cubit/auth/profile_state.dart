part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileIntial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileFetchedSuccessfull extends ProfileState {
  final Profile profile;

  ProfileFetchedSuccessfull(this.profile);
}

class ProfileLoadingFailed extends ProfileState {
  final String error;

  ProfileLoadingFailed(this.error);
}

class ChangePasswordLoading extends ProfileState {}

class ChangePasswordSuccessful extends ProfileState {}

class ChangePasswordFailed extends ProfileState {
  final String? error;

  ChangePasswordFailed(this.error);
}

class UpdateUserLoading extends ProfileState {}

class UpdateUserSuccessful extends ProfileState {}

class UpdateUserError extends ProfileState {
  final String? error;
  UpdateUserError(this.error);
}

class DistrictsLoading extends ProfileState {}

class DistrictsFetchedSuccessfully extends ProfileState {
  final List<District> districts;

  DistrictsFetchedSuccessfully(this.districts);
}

class DistrictsFetchFailed extends ProfileState {
  final String? error;

  DistrictsFetchFailed(this.error);
}
