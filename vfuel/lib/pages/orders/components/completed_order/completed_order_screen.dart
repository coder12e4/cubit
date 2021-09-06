import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/cubit/compleated_oder/completed_order_cubit.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/widgets/empty-state.dart';

import './completed_order_tile.dart';

class CompletedOrderBody extends StatelessWidget {
  const CompletedOrderBody({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CompletedOrderCubit>(context).getData();
    return Container(child:
        BlocBuilder<CompletedOrderCubit, CompletedOrderState>(
            builder: (context, state) {
      if (state is CompletedOrderLoaded) {
        final List<OrderData> orders = state.orders;
        if (orders.isEmpty) {
          return EmptyStateView(
            title: "You dont have any completed orders yet",
            message: "",
          );
        } else {
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              return CompletedOrderTile(orderData: orders[index]);
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
