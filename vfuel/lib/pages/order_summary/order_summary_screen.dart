import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/order_summary/order_summary_cubit.dart';
import 'package:vfuel/cubit/repository/order_create_repository.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:popover/popover.dart';

class OrderSummary extends StatefulWidget {
  final DateTime selectedDate;
  final String? selectedLocation;
  final DeliveryAddress? selectedAddress;
  final double todayPrice;
  final double qty;
  final String? productid;
  OrderSummary({
    required this.selectedLocation,
    required this.qty,
    required this.selectedAddress,
    required this.selectedDate,
    required this.todayPrice,
    required this.productid,
  });

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  final double leftPadding = 20;
  late OrderSummaryCubit _orderSummaryCubit;
  @override
  void initState() {
    super.initState();
    _orderSummaryCubit = OrderSummaryCubit(OrderCreateRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => _orderSummaryCubit,
        child: BlocListener(
          bloc: _orderSummaryCubit,
          listener: (context, dynamic State) {
            if (State is OrderSummaryLoading) {
              Utils.showLoadingIndicator(context);
            } else if (State is OrderSummaryError) {
              Utils.dismissLoadingIndicator(context);
              Utils.showDialouge(context, AlertType.error, "Oops!",
                  'Something Went wrong your order not placed',
                  okButtonCallBack: () {
                Navigator.pop(context);
              });
            } else if (State is OrderSummaryLoaded) {
              Utils.dismissLoadingIndicator(context);
              Utils.showDialouge(context, AlertType.success, "Success",
                  "Your Order has been placed", okButtonCallBack: () {
                Navigator.pop(context);
              });
            } else {}
          },
          child: body(),
        ),
      ),
    );
  }

  Widget body() {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 15),
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.arrow_back,
                    color: Color(0xff024260),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  'Checkout',
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xff024260),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 45, left: leftPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  vfuelText(
                    text: 'Address',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontColor: Color(0xff024260),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16, top: 6),
                    padding: EdgeInsets.only(left: 15),
                    height: 31,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: .08,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/images/bulding_location.png"),
                        SizedBox(
                          width: 11,
                        ),
                        vfuelWrapperText(
                          text: widget.selectedLocation,
                          fontSize: 13,
                          fontColor: Color(0xff4C4F59),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  vfuelText(
                    text: 'Order Summary',
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    fontColor: Color(0xff024260),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 16, top: 7),
                    padding: EdgeInsets.only(left: 15),
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: .8,
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          right: 19,
                          top: 18,
                          child: Icon(
                            Icons.edit,
                            size: 12,
                            color: Color(0xffF2642C),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                // color: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    vfuelWrapperText(
                                      text: 'Type',
                                      fontSize: 14,
                                      fontColor: Color(0xff5A5A5A),
                                    ),
                                    vfuelWrapperText(
                                      text: 'Qty',
                                      fontSize: 14,
                                      fontColor: Color(0xff5A5A5A),
                                    ),
                                    vfuelWrapperText(
                                      text: 'Delivery Date',
                                      fontSize: 14,
                                      fontColor: Color(0xff5A5A5A),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                // color: Colors.red,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    vfuelText(
                                      text: 'Diesel',
                                      fontSize: 14,
                                      fontColor: Color(0xff024260),
                                    ),
                                    vfuelText(
                                      text: '${widget.qty}L',
                                      fontSize: 14,
                                      fontColor: Color(0xff024260),
                                    ),
                                    vfuelText(
                                      text: Utils.getDateString(
                                          widget.selectedDate),
                                      fontSize: 14,
                                      fontColor: Color(0xff024260),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: InkWell(
                            child: Container(
                              // color: Colors.grey,
                              height: 50,
                              width: 50,
                              child: Container(
                                padding: EdgeInsets.only(
                                    bottom: 15, left: 15, right: 15, top: 15),
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  "assets/images/pathedit.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 20, top: 10),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            vfuelWrapperText(
                              text: 'Total',
                              fontSize: 14,
                              fontColor: Color(0xff696969),
                            ),
                            vfuelText(
                              text: total(widget.qty, widget.todayPrice)
                                  .toString(),
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontColor: Color(0xff024260),
                            )
                          ],
                        ),
                        message(),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: vfuelButton(
                    height: 60,
                    width: 126,
                    onPressed: () {
                      _orderSummaryCubit.placeOrder(
                          address: widget.selectedAddress,
                          date: widget.selectedDate.toString(),
                          qty: widget.qty,
                          id: widget.productid,
                          reorder: false,
                          reorderId: '');
                    },
                    gradient: vfuelColors.buttonOrangeGradient,
                    title: 'Confirm',
                    textColor: Colors.white,
                    cornerRadius: 10,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class message extends StatelessWidget {
  const message({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          // backgroundColor: Colors.red,

          // transitionDuration:
          //     const Duration(milliseconds: 150),
          context: context,
          // direction: PopoverDirection.top,
          width: 330,
          height: 80,
          arrowHeight: 15,
          arrowWidth: 30,
          bodyBuilder: (context) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'This tentative amount will vary on the day of delivery as per the daily fuel charge.',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
        width: 20,
        child: Image.asset(
          'assets/images/i_icon.png',
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}

double total(double qty, double price) {
  print(price);
  return qty * price;
}
