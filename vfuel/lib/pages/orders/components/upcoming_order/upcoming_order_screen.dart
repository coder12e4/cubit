import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/cubit/upcoming_order/upcoming_order_cubit.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/pages/orders/components/upcoming_order/upcoming_order_tile.dart';
import 'package:vfuel/widgets/empty-state.dart';

class UpcomingOrderBody extends StatelessWidget {
  const UpcomingOrderBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UpcomingOrderCubit>(context).getData();
    return Container(child: BlocBuilder<UpcomingOrderCubit, UpcomingOrderState>(
        builder: (context, state) {
      if (state is UpcomingOrderLoaded) {
        final List<OrderData> orders = state.orders;
        if (orders.isEmpty) {
          return EmptyStateView(
            title: "You dont have any upcoming orders",
            message: "",
          );
        } else {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return UpcomingOrderTile(orderData: orders[index]);
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
