part of 'upcoming_order_cubit.dart';

@immutable
abstract class UpcomingOrderState {}

class UpcomingOrderInitial extends UpcomingOrderState {}

class UpcomingOrderLoading extends UpcomingOrderState {}

class UpcomingOrderLoaded extends UpcomingOrderState {
  final List<OrderData> orders;
  UpcomingOrderLoaded(this.orders);

  List<Object> get props => [orders];
}

class UpcomingOrderError extends UpcomingOrderState {}
