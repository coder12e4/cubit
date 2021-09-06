part of 'active_order_cubit.dart';

@immutable
abstract class ActiveOrderState {}

class ActiveOrderInitial extends ActiveOrderState {}

class ActiveOrderLoading extends ActiveOrderState {}

class ActiveOrderLoaded extends ActiveOrderState {
  final List<OrderData> orders;
  ActiveOrderLoaded(this.orders);

  List<Object> get props => [orders];
}

class ActiveOrderError extends ActiveOrderState {}

class ProfileLoading extends ActiveOrderState {}

class ProfileFetchedSuccessfull extends ActiveOrderState {
  final Profile profile;

  ProfileFetchedSuccessfull(this.profile);
}

class ProfileLoadingFailed extends ActiveOrderState {
  final String error;

  ProfileLoadingFailed(this.error);
}
