import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:result_type/result_type.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/cubit/repository/orders_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/models/profile.dart';

import '../order_list_function.dart';

part 'active_order_state.dart';

class ActiveOrderCubit extends Cubit<ActiveOrderState> {
  ActiveOrderCubit({required this.ordersListRepository})
      : super(ActiveOrderInitial());
  final OrdersListRepository ordersListRepository;
  void getData() async {
    emit(ActiveOrderLoading());
    Result result = await ordersListRepository.getOrders();

    if (result.isSuccess) {
      dynamic resultData = result.success;

      List<OrderData> ordersListdata = await ordersList(resultData, 'Approved');

      emit(ActiveOrderLoaded(ordersListdata));
    } else {
      emit(ActiveOrderError());
    }
  }

  Future<void> fetchUserProfile() async {
    UserSession? _usersesion = await UserManager.instance.getUserSession();
    emit(ProfileLoading());

    Profile profile = UserManager.instance.getCurrentUserProfile();
    if (profile != null) {
      emit(ProfileFetchedSuccessfull(profile));
    } else {
      emit(ProfileLoadingFailed("Profile fetching failed"));
    }
  }
}
