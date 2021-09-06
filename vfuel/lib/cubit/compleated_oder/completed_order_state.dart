part of 'completed_order_cubit.dart';

@immutable
abstract class CompletedOrderState {}

class CompletedOrderInitial extends CompletedOrderState {}

class CompletedOrderLoading extends CompletedOrderState {}

class CompletedOrderLoaded extends CompletedOrderState {
  final List<OrderData> orders;
  CompletedOrderLoaded(this.orders);

  List<Object> get props => [orders];
}

class CompletedOrderError extends CompletedOrderState {}
