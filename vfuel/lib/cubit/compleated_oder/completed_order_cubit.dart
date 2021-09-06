import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/cubit/repository/orders_repository.dart';
import 'package:vfuel/models/order.dart';

import '../order_list_function.dart';

part 'completed_order_state.dart';

class CompletedOrderCubit extends Cubit<CompletedOrderState> {
  CompletedOrderCubit({required this.ordersListRepository})
      : super(CompletedOrderInitial());
  final OrdersListRepository ordersListRepository;
  void getData() async {
    emit(CompletedOrderLoading());
    Result result = await ordersListRepository.getOrders();

    if (result.isSuccess) {
      dynamic resultData = result.success;

      List<OrderData> ordersListdata = await ordersList(resultData, 'Approved');

      emit(CompletedOrderLoaded(ordersListdata));
    } else {
      emit(CompletedOrderError());
    }
  }
}
