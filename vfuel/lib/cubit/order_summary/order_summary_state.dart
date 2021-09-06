part of 'order_summary_cubit.dart';

@immutable
abstract class OrderSummaryState {}

class OrderSummaryInitial extends OrderSummaryState {}

class OrderSummaryLoading extends OrderSummaryState {}

class OrderSummaryError extends OrderSummaryState {}

class OrderSummaryLoaded extends OrderSummaryState {}
