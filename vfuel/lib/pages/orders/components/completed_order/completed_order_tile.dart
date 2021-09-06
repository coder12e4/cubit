import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/models/order.dart';
import 'package:vfuel/pages/home/HomeScreen.dart';
import 'package:vfuel/pages/orders/reorder.dart';
import 'package:vfuel/widgets/vfuel_button.dart';

import '../details_text.dart';

class CompletedOrderTile extends StatefulWidget {
  const CompletedOrderTile({Key? key, required this.orderData})
      : super(key: key);
  final OrderData orderData;
  @override
  State<CompletedOrderTile> createState() => _OrderTileState();
}

class _OrderTileState extends State<CompletedOrderTile> {
  TextEditingController commentTextController = TextEditingController();
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
        height: !isLoaded ? 176 : 750,
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
                color: Color(0xffF2642C),
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
                              (HomeScreenState.configuration.products!.first
                                          .price! *
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
                              children: [
                                textButton('Invoice', () {}),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(right: 14, top: 0),
                                  child: vfuelButton(
                                      cornerRadius: 10,
                                      gradient:
                                          vfuelColors.buttonOrangeGradient,
                                      title: "Re Order",
                                      textColor: Colors.white,
                                      width: 144,
                                      height: 40,
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ReOrder(
                                            selectedLocation:
                                                widget.orderData.deliveryPoint,
                                            qty: double.parse(widget
                                                .orderData.ordereQty
                                                .toString()),
                                            selectedAddress: widget
                                                .orderData.deliveryAddress,
                                            totalPrice: widget.orderData.total,
                                            productid: widget.orderData.orderId,
                                            reordertid:
                                                widget.orderData.reorderId,
                                          );
                                        }));
                                      }),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            margin:
                                EdgeInsets.only(top: 29, right: 14, bottom: 19),
                            padding: EdgeInsets.only(right: 14),
                            width: 300,
                            color: Colors.grey.shade300,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 0, bottom: 11),
                            child: Text(
                              'Rate',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff024260),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Container(
                            width: 188,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFEA539),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFEA539),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFEA539),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFEA539),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Color(0xffFEA539),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 18),
                            height: 100,
                            width: 300,
                            child: TextField(
                              controller: commentTextController,
                              minLines: 1,
                              maxLines: 3,
                              scrollPadding: EdgeInsets.all(1),
                              decoration: InputDecoration(
                                hintText: 'Comment',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Color(0xff5A5A5A),
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .83,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 14),
                                  child: Image.asset(
                                    "assets/images/share1.png",
                                    width: 64,
                                  ),
                                ),
                                textButton('Submit', () {}),
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

Widget textButton(String title, Function onTap) {
  return GestureDetector(
    child: Container(
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xff464646),
          ),
        ),
      ),
      height: 44,
      width: 144,
      margin: EdgeInsets.only(left: 0, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xffF2642C),
        ),
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    onTap: onTap as void Function()?,
  );
}
