import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/cubit/active_order/active_order_cubit.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/widgets/empty-state.dart';

import 'active_order_tile.dart';

class ActiveOrderBody extends StatelessWidget {
  const ActiveOrderBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ActiveOrderCubit>(context).getData();
    return Container(child: BlocBuilder<ActiveOrderCubit, ActiveOrderState>(
        builder: (context, state) {
      if (state is ActiveOrderLoaded) {
        final List<OrderData> orders = state.orders;
        if (orders.isEmpty) {
          return EmptyStateView(
            title: "You dont have any active orders yet",
            message: "",
          );
        } else {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return ActiveOrderTile(orderData: orders[index]);
            },
          );
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }
}
