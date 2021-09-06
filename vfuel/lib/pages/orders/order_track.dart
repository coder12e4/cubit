import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/pages/orders/components/active_order/active_order_tile.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

class OrderTracking extends StatefulWidget {
  @override
  _OrderTrackingState createState() => _OrderTrackingState();
}

class _OrderTrackingState extends State<OrderTracking> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: deviceHeight * 0.05),
                    height: deviceHeight * 0.1,
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: deviceWidth * 0.4,
                                left: deviceWidth * 0.07)),
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: deviceWidth * 0.05)),
                        vfuelText(
                          text: 'Track the order',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: vfuelColors.orangeBoxBgColor,
                    height: deviceHeight * 0.15,
                    width: deviceWidth * 0.5,
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.only(top: deviceHeight * 0.035)),
                      Row(
                        children: [
                          Padding(
                              padding:
                                  EdgeInsets.only(left: deviceWidth * 0.1)),
                          Text(
                            "Estimated Time",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontFamily: "Poppins Regular",
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: deviceWidth * 0.27)),
                          Text(
                            "Order Number",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontFamily: "Poppins Regular",
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: deviceWidth * 0.16,
                                  top: deviceHeight * 0.05)),
                          Text(
                            "1H:30m",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontFamily: "Poppins Regular",
                              fontSize: 15.0,
                              color: Color.fromRGBO(54, 54, 54, 1),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: deviceWidth * 0.38)),
                          Text(
                            orderId!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              fontFamily: "Poppins Regular",
                              fontSize: 15.0,
                              color: Color.fromRGBO(54, 54, 54, 1),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ]),
                  ),
                  Row(
                    children: [stepperLine()],
                  ),
                  Padding(padding: EdgeInsets.only(top: deviceHeight * 0.04)),
                  callandTrack(),
                  Container(
                    height: deviceHeight * 0.1,
                  )
                ]),
          ),
        ]),
      ),
    );
  }

  stepperLine() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      margin:
          EdgeInsets.only(top: deviceHeight * 0.05, left: deviceWidth * 0.2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(
              Icons.circle,
              color: Color.fromRGBO(116, 180, 47, 1),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.1)),
            Container(
              height: deviceHeight * 0.06,
              width: deviceWidth * 0.06,
              child: Image.asset('assets/images/document.png'),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.05)),
            Column(children: [
              vfuelText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontColor: Color.fromRGBO(98, 100, 99, 1),
                text: 'Order Placed',
              ),
              Padding(padding: EdgeInsets.only(top: deviceWidth * 0.015)),
              vfuelText(
                fontSize: 12,
                fontColor: Color.fromRGBO(114, 114, 118, 1),
                text: '15 May 2021 8:46 PM',
              ),
            ])
          ]),
          Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.03),
            color: Color.fromRGBO(116, 180, 47, 1),
            height: deviceHeight * 0.1,
            width: deviceWidth * .008,
          ),
          Row(children: [
            Icon(
              Icons.circle,
              color: Color.fromRGBO(116, 180, 47, 1),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.1)),
            Container(
              height: deviceHeight * 0.065,
              width: deviceWidth * 0.065,
              child: Image.asset('assets/images/thumbsup.png'),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.05)),
            Column(children: [
              vfuelText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontColor: Color.fromRGBO(98, 100, 99, 1),
                text: 'Order Confirmed',
              ),
              Padding(padding: EdgeInsets.only(top: deviceWidth * 0.015)),
              vfuelText(
                fontSize: 12,
                fontColor: Color.fromRGBO(114, 114, 118, 1),
                text: '15 May 2021 9:00 PM',
              ),
            ])
          ]),
          Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.03),
            color: Color.fromRGBO(116, 180, 47, 1),
            height: deviceHeight * 0.1,
            width: deviceWidth * .008,
          ),
          Row(children: [
            Icon(
              Icons.circle,
              color: Color.fromRGBO(254, 165, 57, 1),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.1)),
            Container(
              height: deviceHeight * 0.06,
              width: deviceWidth * 0.06,
              child: Image.asset('assets/images/gusicon.png'),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.05)),
            Column(children: [
              vfuelText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontColor: Color.fromRGBO(98, 100, 99, 1),
                text: 'Order on the way',
              ),
              Padding(padding: EdgeInsets.only(top: deviceWidth * 0.015)),
              vfuelText(
                fontSize: 12,
                fontColor: Color.fromRGBO(114, 114, 118, 1),
                text: '16 May 2021 9:00 AM',
              ),
            ])
          ]),
          Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.03),
            color: Color.fromRGBO(216, 216, 216, 1),
            height: deviceHeight * 0.1,
            width: deviceWidth * .008,
          ),
          Row(children: [
            Icon(
              Icons.circle,
              color: Color.fromRGBO(216, 216, 216, 1),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.1)),
            Container(
              height: deviceHeight * 0.06,
              width: deviceWidth * 0.06,
              child: Image.asset('assets/images/smileicon.png'),
            ),
            Padding(padding: EdgeInsets.only(left: deviceWidth * 0.05)),
            Column(children: [
              vfuelText(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontColor: Color.fromRGBO(98, 100, 99, 1),
                text: 'Order Complete !',
              ),
            ])
          ]),
        ],
      ),
    );
  }

  callandTrack() {
    final CallService? _service = locator!<CallService>();
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.05),
            width: deviceWidth * 0.4,
            height: 50.0,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(242, 100, 44, 1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: InkWell(
                onTap: () {
                  _service!.call('8891758917');
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Icon(
                    Icons.call,
                    color: Color.fromRGBO(242, 100, 44, 1),
                  ),
                  Padding(padding: EdgeInsets.only(left: deviceWidth * 0.023)),
                  Text('Call Driver',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontFamily: "Poppins Bold",
                      )),
                ])),
          ),
          Container(
            margin: EdgeInsets.only(left: deviceWidth * 0.1),
            width: deviceWidth * 0.4,
            height: 50.0,
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromRGBO(242, 100, 44, 1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: InkWell(
                onTap: () {},
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    height: deviceHeight * 0.05,
                    width: deviceWidth * 0.05,
                    child: Image.asset('assets/images/locationicon.png'),
                  ),
                  Padding(padding: EdgeInsets.only(left: deviceWidth * 0.023)),
                  Text('Go to Map',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Color.fromRGBO(70, 70, 70, 1),
                        fontFamily: "Poppins Bold",
                      )),
                ])),
          )
        ],
      ),
    );
  }
}

class CallService {
  void call(String number) => launch('tel:$number');
}

GetIt? locator;
void set() {
  locator!.registerSingleton(CallService());
}
