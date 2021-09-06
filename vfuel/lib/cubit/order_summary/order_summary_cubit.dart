import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/cubit/repository/order_create_repository.dart';
import 'package:vfuel/models/profile.dart';

part 'order_summary_state.dart';

class OrderSummaryCubit extends Cubit<OrderSummaryState> {
  OrderSummaryCubit(this.orderCreateRepository) : super(OrderSummaryInitial());
  final OrderCreateRepository orderCreateRepository;
  void placeOrder(
      {DeliveryAddress? address,
      String? date,
      String? id,
      double? qty,
      required bool reorder,
      String? reorderId}) async {
    emit(OrderSummaryLoading());

    Result result = await orderCreateRepository.addOrder(
        address, date, id, qty, reorder, reorderId);

    if (result.isSuccess) {
      emit(OrderSummaryLoaded());
    } else {
      emit(OrderSummaryError());
    }
  }
}
