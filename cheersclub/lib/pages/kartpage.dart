import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class kartpage extends StatefulWidget {
  const kartpage({Key? key}) : super(key: key);

  @override
  _kartpageState createState() => _kartpageState();
}

class _kartpageState extends State<kartpage> {
  bool value = false;
  bool value_bussiness = false;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  var _chosenValue;

  Widget myAppBarIcon() {
    return Container(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 26,
          ),
          Container(
            width: 27,
            height: 30,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor("FFC853"),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("1A1B1D"),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
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
                            Container(
                                margin: EdgeInsets.only(right: 10, top: 40),
                                child: myAppBarIcon()),
                          ],
                        ),
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
                    margin: EdgeInsets.only(left: 20, top: 30),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 6),
                          height: 24,
                          width: 24,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(24),
                              border:
                                  Border.all(color: Colors.amber, width: 2)),
                          margin: EdgeInsets.only(right: 0, top: 0),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.amber,
                              size: 12,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const CheersClubText(
                          text: "MY KART",
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CheersClubText(
                                text: "(Items)",
                                fontColor: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  color: HexColor("5D5D5E"),
                  height: 40,
                  margin: EdgeInsets.only(top: 20, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Discription",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Quantity",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Remove",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: HexColor("5D5D5E"),
                  height: 40,
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "MIMOSA",
                        style: TextStyle(
                            color: HexColor("FFC853"),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "2",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.delete_outline_rounded,
                        size: 16,
                        color: HexColor("FFC853"),
                      )
                    ],
                  ),
                ),
                Container(
//                  color: HexColor("5D5D5E"),
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Transacton fee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "500",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
//                  color: HexColor("5D5D5E"),
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Transacton fee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "500",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
//                  color: HexColor("5D5D5E"),
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "500",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
//                  color: HexColor("5D5D5E"),
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "vat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "500",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
//                  color: HexColor("5D5D5E"),
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Vat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "500",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: HexColor("5D5D5E"),
                  height: 40,
                  padding: EdgeInsets.only(left: 20, right: 20),
                  margin: EdgeInsets.only(top: 0, bottom: 0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.white,
                    width: 1,
                  ))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            color: HexColor("FFC853"),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: SizedBox()),
                      Text(
                        "2000",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CheersClubText(
                        text: "Whom to supprice",
                        fontColor: Colors.amber,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 220, top: 20),
                  child: CheersClubText(
                    text: "Reriptent name",
                    fontColor: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: TextField(
                    //controller: Password_Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                      filled: true,
                      fillColor: HexColor("28292C"),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  width: MediaQuery.of(context).size.width - 60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CheersClubText(
                        text: "Order type",
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 30, top: 0),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 0, top: 0),
                        child: const CheersClubText(
                          text: "Instant",
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Checkbox(
                        activeColor: HexColor("FEC753"),
                        side: BorderSide(color: Colors.amber),
                        checkColor: Colors.white,
                        value: this.value,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value_bussiness = false;
                            this.value = value!;
                          });
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 0, top: 0),
                        child: const CheersClubText(
                          text: "Scheduled",
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Checkbox(
                        activeColor: HexColor("FEC753"),
                        side: BorderSide(color: Colors.amber),
                        checkColor: Colors.white,
                        value: this.value_bussiness,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value = false;
                            this.value_bussiness = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  color: HexColor("28292C"),
                  padding: EdgeInsets.only(left: 6, right: 6),
                  margin: EdgeInsets.only(left: 20, right: 30, top: 0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      focusColor: HexColor("28292C"),
                      value: _chosenValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.amber,
                      items: <String>[
                        '91 india1',
                        '91 india2',
                        '91 india3 ',
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
                        "91 india",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 220, top: 20),
                  child: CheersClubText(
                    text: "Phone ",
                    fontColor: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: TextField(
                    //controller: Password_Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                      filled: true,
                      fillColor: HexColor("28292C"),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 220, top: 20),
                  child: CheersClubText(
                    text: "Reciptant Message ",
                    fontColor: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: TextField(
                    //controller: Password_Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                      filled: true,
                      fillColor: HexColor("28292C"),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 220, top: 20),
                  child: CheersClubText(
                    text: "Image/Videos ",
                    fontColor: Colors.white,
                  ),
                ),
                Container(
                  height: 40,
                  color: HexColor("28292C"),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                        height: 20,
                        width: 100,
                        child: Center(
                          child: CheersClubText(
                            text: "Choose file",
                            fontColor: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 220, top: 20),
                  child: CheersClubText(
                    text: "Request to Restourent ",
                    fontColor: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 4),
                  child: TextField(
                    //controller: Password_Controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                      filled: true,
                      fillColor: HexColor("28292C"),
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 6.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: HexColor("28292C")),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  color: HexColor("FFC853"),
                  margin: EdgeInsets.only(
                      left: 20, right: 220, top: 20, bottom: 30),
                  child: Center(
                    child: CheersClubText(
                      text: "Pay 199",
                      fontColor: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
