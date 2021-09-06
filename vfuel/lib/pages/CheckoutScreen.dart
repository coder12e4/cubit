import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget{
  @override _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 44.0,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0, right: 11.88, top: 5.0, bottom: 5.0),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF024260),
                        ),
                      ),
                      Text(
                        "Checkout",
                        style: TextStyle(
                          color: Color(0xFF024260),
                          fontSize: 14.0,
                          fontFamily: "Poppins Regular",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: [
                          Text(
                            "Delivery",
                            style: TextStyle(
                              color: Color(0xFF024260),
                              fontSize: 14.0,
                              fontFamily: "Poppins Regular",
                            ),
                          ),
                          Container(
                            color: Color(0xFF74B42F),
                            alignment: Alignment.bottomCenter,
                            height: 2.0,
                            width: 30.0,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Payment",
                            style: TextStyle(
                              color: Color(0xFF024260),
                              fontSize: 14.0,
                              fontFamily: "Poppins Regular",
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              width: double.infinity,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 26.0,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Poppins Regular",
                          color: Color(0xFF024260),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Icon(
                                Icons.more_vert_rounded,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 29.0),
                              child: Text("Maxwell Industries\nCherppu, Thirssur\nKerala Pin 676519"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.fromLTRB(21.0, 0.0, 15.0, 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                      child: Text(
                        "Order Summary",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: "Poppins Regular",
                          color: Color(0xFF024260),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 86.0, 0.0),
                        child: Text(
                          "Type",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins Regular",
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Super Diesel",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins Regular",
                            color: Color(0xFF4E4E4E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 19.0, 96.0, 0.0),
                        child: Text(
                          "Qty",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins Regular",
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 19.0, 0.0, 0.0),
                        child: Text(
                          "50L",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins Regular",
                            color: Color(0xFF4E4E4E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(25.0, 19.0, 28.0, 0.0),
                        child: Text(
                          "Delivery Date",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins Regular",
                            color: Color(0xFF9B9B9B),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0.0, 19.0, 0.0, 0.0),
                        child: Text(
                          "14 Mon 2021",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: "Poppins Regular",
                            color: Color(0xFF4E4E4E),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 148.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins Regular",
                                color: Color(0xFF696969),
                              ),
                            ),
                            Text(
                              "450000.00",
                              style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: "Poppins Regular",
                                color: Color(0xFF024260),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 24.0),
                        child: RaisedButton(
                            splashColor: Colors.green,
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffF2642C),
                                    Color(0xffFEA539),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Container(
                                constraints: BoxConstraints(maxWidth: 126.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Confirm",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins Bold",
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100.0,
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xFFE4F4FC),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.zero
                ),
              ),
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}