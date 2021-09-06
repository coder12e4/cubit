import 'package:vfuel/cubit/active_order/active_order_cubit.dart';
import 'package:vfuel/cubit/compleated_oder/completed_order_cubit.dart';
import 'package:vfuel/cubit/repository/orders_repository.dart';
import 'package:vfuel/cubit/upcoming_order/upcoming_order_cubit.dart';
import 'package:vfuel/pages/orders/components/completed_order/completed_order_screen.dart';
import 'package:vfuel/pages/orders/components/upcoming_order/upcoming_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './components/catagory.dart';
import 'components/active_order/active_order_screen.dart';
import 'components/active_order/active_order_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdetScreen extends StatefulWidget {
  @override
  _OrdetScreenState createState() => _OrdetScreenState();
}

class _OrdetScreenState extends State<OrdetScreen> {
  OrderCategory selectedOrder = OrderCategory.Active;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 34),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 24,
                      ),
                      child: GestureDetector(
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                          padding: EdgeInsets.only(left: 30, right: 10),
                          child: Row(
                            children: [
                              GestureDetector(
                                child: orderSelection(
                                  title: 'Active Order',
                                  isSelcted:
                                      selectedOrder == OrderCategory.Active,
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedOrder = OrderCategory.Active;
                                  });
                                },
                              ),
                              GestureDetector(
                                child: orderSelection(
                                  title: 'Upcoming order',
                                  isSelcted:
                                      selectedOrder == OrderCategory.Upcoming,
                                ),
                                onTap: () {
                                  setState(() {
                                    selectedOrder = OrderCategory.Upcoming;
                                  });
                                },
                              ),
                              GestureDetector(
                                  child: orderSelection(
                                    title: 'Completed Order',
                                    isSelcted: selectedOrder ==
                                        OrderCategory.Completed,
                                  ),
                                  onTap: () {
                                    setState(() {
                                      selectedOrder = OrderCategory.Completed;
                                    });
                                  }),
                              SizedBox(
                                width: 24,
                              )
                            ],
                          )),
                    )),
                  ],
                )),
            Expanded(
              child: orderBody(selectedOrder),
            )
          ],
        ),
      ),
    );
  }
}

Widget orderBody(OrderCategory selectedOrder) {
  if (selectedOrder == OrderCategory.Active) {
    return BlocProvider(
        create: (context) =>
            ActiveOrderCubit(ordersListRepository: OrdersListRepository()),
        child: ActiveOrderBody());
  } else if (selectedOrder == OrderCategory.Upcoming) {
    return BlocProvider(
        create: (context) =>
            UpcomingOrderCubit(ordersListRepository: OrdersListRepository()),
        child: UpcomingOrderBody());
  } else {
    return BlocProvider(
        create: (context) =>
            CompletedOrderCubit(ordersListRepository: OrdersListRepository()),
        child: CompletedOrderBody());
  }
}

Widget orderSelection({required String title, required bool isSelcted}) {
  return Padding(
    padding: const EdgeInsets.only(left: 27, top: 27, bottom: 27),
    child: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: isSelcted
                  ? Color(
                      0xff020433,
                    )
                  : Color(0x28020433),
              fontWeight: FontWeight.w500),
        ),
        Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelcted ? Color(0xffF0727F) : Colors.white.withOpacity(0),
          ),
        )
      ],
    ),
  );
}
