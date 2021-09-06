import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/cubit/repository/orders_repository.dart';
import 'package:vfuel/models/order.dart';

import '../order_list_function.dart';

part 'upcoming_order_state.dart';

class UpcomingOrderCubit extends Cubit<UpcomingOrderState> {
  UpcomingOrderCubit({required this.ordersListRepository})
      : super(UpcomingOrderInitial());
  final OrdersListRepository ordersListRepository;
  void getData() async {
    emit(UpcomingOrderLoading());

    Result result = await ordersListRepository.getOrders();
    if (result.isSuccess) {
      dynamic resultData = result.success;

      List<OrderData> ordersListdata = await ordersList(resultData, 'Pending');
      emit(UpcomingOrderLoaded(ordersListdata));
    } else {
      emit(UpcomingOrderError());
    }
  }
}
