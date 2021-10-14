import 'package:cheersclub/pages/kartpage.dart';
import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool value = false;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  String? _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: Container(
        // height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width - 40,
        decoration: BoxDecoration(
            color: HexColor("1A1B1D"),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
        child: Expanded(
          child: ListView(
            children: [
              Container(
                height: 120,
                child: Container(
                  color: HexColor("131313"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 13, top: 25),
                        padding: EdgeInsets.all(5),
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.fitHeight,
                          height: 45,
                          //width: 220,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.only(left: 6),
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                      color: Colors.amber, width: 2)),
                              margin: EdgeInsets.only(right: 20, top: 40),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.amber,
                                  size: 12,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "HOME",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 70,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 70,
                        color: HexColor("FEC753"),
                        margin: EdgeInsets.only(
                            left: 30, top: 15, bottom: 15, right: 30),
                        child: Center(
                          child: const CheersClubText(
                            text: "Login",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "NEW USER",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "PLACE AN ORDER",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "TERMS AND CONDITIONS",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "PRIVACY STATEMENTS",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "SETTINGS",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "FAQ",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    CheersClubText(
                      text: "CONATACT US",
                      fontColor: Colors.white,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: HexColor("1A1B1D"),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: HexColor("1A1B1D"),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Container(
                    color: HexColor("131313"),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 13, top: 25),
                          padding: EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.fitHeight,
                            height: 55,
                            //width: 220,
                          ),
                        ),
                        Expanded(child: SizedBox()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                _key.currentState!.openEndDrawer();
                                //Scaffold.of(context).openDrawer();
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 20, top: 40),
                                child: Image.asset(
                                  "assets/images/nav.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 20, bottom: 20),
                  child: CheersClubText(
                    text: "Hotel name",
                    fontColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 0, bottom: 20),
                  child: CheersClubText(
                    text: "hotel address",
                    fontColor: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Container(
                  color: HexColor("5D5D5E"),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 36,
                        margin: EdgeInsets.all(0),
                        padding: EdgeInsets.only(left: 4),
                        color: HexColor("FEC753"),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            focusColor: Colors.black,
                            value: _chosenValue,
                            //elevation: 5,
                            dropdownColor: HexColor("FEC753"),
                            style: TextStyle(color: Colors.black),
                            iconEnabledColor: Colors.white,
                            items: <String>[
                              'Drink 1',
                              'Drink 2',
                              'Drink 3',
                              'Drink 4',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(color: Colors.black),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Drinks",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                _chosenValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          focusColor: Colors.black,
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'Drinks',
                            'IOS',
                            'Flutter',
                            'Node',
                            'Java',
                            'Python',
                            'PHP',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            "Desserts",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          focusColor: Colors.black,
                          value: _chosenValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.black),
                          iconEnabledColor: Colors.black,
                          items: <String>[
                            'Drinks',
                            'IOS',
                            'Flutter',
                            'Node',
                            'Java',
                            'Python',
                            'PHP',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          hint: Text(
                            "Bites",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CheersClubText(
                            text: "Dinks name",
                            fontColor: HexColor("FFC853"),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 1000),
                                  type: PageTransitionType.rightToLeft,
                                  child: kartpage(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CheersClubText(
                                      text: "MIMOSA",
                                      fontColor: HexColor("FFC853"),
                                      fontSize: 14,
                                    ),
                                    CheersClubText(
                                      text: "Discription",
                                      fontColor: Colors.white,
                                      fontSize: 14,
                                    ),
                                    CheersClubText(
                                      text: "Glass 10",
                                      fontColor: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
