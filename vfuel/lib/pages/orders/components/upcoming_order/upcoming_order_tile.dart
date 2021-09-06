import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/pages/home/HomeScreen.dart';

import 'package:flutter/material.dart';
import '../details_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../text_button.dart';

class UpcomingOrderTile extends StatefulWidget {
  const UpcomingOrderTile({Key? key, required this.orderData})
      : super(key: key);
  final OrderData orderData;
  @override
  State<UpcomingOrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<UpcomingOrderTile> {
  bool isLoaded = false;
  num angel = 180;
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
        height: !isLoaded ? 176 : 470,
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
                color: Color(0xffFEA539),
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // textButton('Track the Order', () {}),
                                // SizedBox(
                                //   width: MediaQuery.of(context).size.width * .4,
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 65),
                                  child: textButton('Cancel Order', () {}),
                                ),
                              ],
                            ),
                          ),
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
}
