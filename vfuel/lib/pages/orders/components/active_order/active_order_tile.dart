import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/pages/home/HomeScreen.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:flutter/material.dart';
import '../details_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../text_button.dart';

String? orderId;
String? orderDate;

class ActiveOrderTile extends StatefulWidget {
  ActiveOrderTile({Key? key, required this.orderData}) : super(key: key);
  final OrderData orderData;
  @override
  State<ActiveOrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<ActiveOrderTile> {
  late Razorpay _razorpay;

  bool isLoaded = false;
  num angel = 180;
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    angel = isLoaded ? 180 : 90;
    return GestureDetector(
      onTap: () {
        setState(() {
          isLoaded = !isLoaded;
        });
      },
      child: Container(
        height: !isLoaded ? 176 : 550,
        margin: EdgeInsets.only(left: 16, right: 16, top: 2.5, bottom: 2.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Container(
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                color: Color(0xff74B42F),
              ),
            ),
            Positioned(
              right: 10,
              top: 20,
              child: Transform.rotate(
                angle: 180 * math.pi / angel,
                child: Image.asset("assets/images/down_arrow.png"),
              ),
            ),
            Positioned(
              top: 5,
              left: 8,
              child: Container(
                padding: EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order ${widget.orderData.orderId}'),
                    detailsText(
                        title: 'Qty', detail: '${widget.orderData.ordereQty}L'),
                    detailsText(
                        title: 'ETD', detail: widget.orderData.orderEtd),
                    detailsText(
                        title: 'Order by', detail: widget.orderData.ordereBy!),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        children: [
                          Text(
                            'Delivery Point',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0xff9B9B9B),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                              child: Row(
                                children: [
                                  // Icon(
                                  //   Icons.food_bank,
                                  // ),
                                  Image.asset(
                                      "assets/images/bulding_location.png"),

                                  SizedBox(
                                    width: 11,
                                  ),
                                  Text(
                                    widget.orderData.deliveryPoint!,
                                    style: GoogleFonts.poppins(
                                      fontSize: 13,
                                      color: Color(0xff4C4F59),
                                    ),
                                  )
                                ],
                              ),
                              height: 31,
                              decoration: BoxDecoration(
                                  color: Color(0xffEDEDED),
                                  borderRadius: BorderRadius.circular(16)),
                              padding: EdgeInsets.only(left: 12, right: 20))
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isLoaded,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 5),
                            child: Text(
                              'Order Summery',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff024260),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: detailsText(
                                title: 'Type',
                                detail: widget.orderData.fuelType),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: detailsText(
                                title: 'Qty',
                                detail: '${widget.orderData.ordereQty}L'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            child: detailsText(
                                title: 'Delivery Date',
                                detail: Utils.getDateString(
                                    widget.orderData.deliveryDate)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 0),
                            child: Text(
                              'Total',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff696969),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 17),
                            child: Text(
                              (HomeScreenState
                                          .configuration.products!.first.price! *
                                      widget.orderData.ordereQty!)
                                  .toString(),
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff024260),
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Row(
                            children: [
                              textButton('Track the Order', () {
                                setState(() {
                                  orderId = widget.orderData.orderId;
                                });
                                vfuelRouter.navigateTo(
                                    context, Screen.OrderTracking);
                              }),
                              textButton('Cancel Order', () {}),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 14, top: 14),
                            child: vfuelButton(
                                cornerRadius: 5,
                                gradient: vfuelColors.buttonOrangeGradient,
                                title: "Pay Now",
                                textColor: Colors.white,
                                width: 300,
                                onPressed: () async {
                                  print(await UserManager.instance.getUser());
                                  int price = HomeScreenState
                                      .configuration.products!.first.price!;
                                  double amount = (price.toDouble() *
                                      widget.orderData.ordereQty!);

                                  openCheckout(amount);
                                }),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout(double amount) async {
    var options = {
      'key': 'rzp_test_cmjzk2dxO2L1jK',
      'amount': amount * 100,
      'name': 'Diesel',
      'description': 'V Fuel',
      'prefill': {'contact': '8891758917', 'email': 'jithu@gmail.com'},
      'external': {
        'wallets': ['paytm']
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Utils.showDialouge(
      context,
      AlertType.success,
      "Success",
      "Payment Done",
      okButtonText: "OK",
      okButtonCallBack: () {
        Navigator.pop(context, 'Ok');
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Utils.showDialouge(
      context,
      AlertType.success,
      "ERROR" + response.code.toString() + " - " + response.message!,
      "Payment Failed",
      okButtonText: "OK",
      okButtonCallBack: () {
        Navigator.pop(context, 'Ok');

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Utils.showDialouge(
      context,
      AlertType.success,
      "EXTERNAL_WALLET" + response.walletName!,
      "Payment Failed",
      okButtonText: "OK",
      okButtonCallBack: () {
        Navigator.pop(context, 'Ok');

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
      },
    );
  }
}
