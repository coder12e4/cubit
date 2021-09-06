part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeIntial extends HomeState {}

class HomeLoading extends HomeState {}

class ProfileLoading extends HomeState {}

class HomeConfigurationFtechedSuccessfully extends HomeState {
  final Configuration config;

  HomeConfigurationFtechedSuccessfully(this.config);
}

class HomeConfigurationFtechFailed extends HomeState {
  final String? error;

  HomeConfigurationFtechFailed(this.error);
}

class ProfileFetchedSuccessfull extends HomeState {
  final Profile profile;

  ProfileFetchedSuccessfull(this.profile);
}

class ProfileLoadingFailed extends HomeState {
  final String? error;

  ProfileLoadingFailed(this.error);
}
