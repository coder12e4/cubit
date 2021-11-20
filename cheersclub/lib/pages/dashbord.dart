import 'dart:ui';

import 'package:cheersclub/Utils/utils.dart';
import 'package:cheersclub/cubit/auth/dashbord_cubit.dart';
import 'package:cheersclub/cubit/repository/dashbordRepository.dart';
import 'package:cheersclub/models/Restourent/MyGreetings.dart';
import 'package:cheersclub/models/auth/user.dart';
import 'package:cheersclub/pages/LoginScreen.dart';
import 'package:cheersclub/pages/Restourents_list.dart';
import 'package:cheersclub/widgets/CheersAlert.dart';
import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class dash_bord extends StatefulWidget {
  const dash_bord({Key? key}) : super(key: key);
  @override
  _dash_bordState createState() => _dash_bordState();
}

class _dash_bordState extends State<dash_bord> {
  late DashbordCubit dashbordCubit;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool my_oders = true;
  bool my_greetings = false;
  bool my_profile = false;
  var no = 0;
  bool _isAlwaysShown = true;
  var CurrentPassword_Controller = TextEditingController();
  var NewPassword_Controller = TextEditingController();
  var ConfirmPassword_Controller = TextEditingController();
  var txt_fullname_Controller = TextEditingController();
  var txt_address_Controller = TextEditingController();
  var txt_Phoneno_Controller = TextEditingController();
  var txt_zip_Controller = TextEditingController();
  var txt_Country_Controller = TextEditingController();
  var txt_city_Controller = TextEditingController();

  bool _showTrackOnHover = false;
  late ScrollController scrollcontroller;

  Widget myoders() {
    return ListView.builder(
        itemCount: OrderListdata.length,
        itemBuilder: (context, count) {
          return Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 57,
                  color: HexColor("464749"),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheersClubText(
                            text: OrderListdata[count].name,
                            fontColor: Colors.amber,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            "" + OrderListdata[count].id.toString(),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Expanded(child: SizedBox()),
                      Container(
                        width: 80,
                        height: 20,
                        color: HexColor("269100"),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CheersClubText(
                              text: "Completed",
                              fontColor: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  color: HexColor("2C2D2F"),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheersClubText(
                            text: "Secret Key",
                            fontColor: Colors.amber,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            OrderListdata[count].userSecret.toString(),
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheersClubText(
                            text: OrderListdata[count].deliveryDate.toString(),
                            fontColor: Colors.amber,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            OrderListdata[count].price.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget mygreetings() {
    return ListView.builder(
        itemCount: greetingListdata.length,
        itemBuilder: (context, count) {
          return Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 57,
                  color: HexColor("464749"),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheersClubText(
                            text: "Recipient",
                            fontColor: Colors.amber,
                            fontSize: 13,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            greetingListdata[count].name!,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CheersClubText(
                            text: "Delivary Date",
                            fontColor: Colors.amber,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            greetingListdata[count].deliveryDate!,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Container(
                        width: 80,
                        height: 24,
                        color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CheersClubText(
                              text: "EDIT ",
                              fontColor: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 2),
                              height: 12,
                              width: 12,
                              child: Image.asset("assets/images/editicon.png"),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget myprofile() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(10),
              height: 58,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          pd = 0;
                        });

                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            backgroundColor: Colors.amber,
                            content: Container(
                              color: Colors.amber,
                              height: 270,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(child: SizedBox()),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          height: 24,
                                          width: 24,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: Colors.black),
                                          child: Icon(
                                            Icons.clear_outlined,
                                            color: Colors.white,
                                            size: 14,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, top: 10),
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller: CurrentPassword_Controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'Current password'.toUpperCase(),
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        filled: true,
                                        fillColor: HexColor("28292C"),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("28292C")),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("28292C")),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, top: 10),
                                    child: TextField(
                                      controller: NewPassword_Controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'New password'.toUpperCase(),
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        filled: true,
                                        fillColor: HexColor("28292C"),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("28292C")),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("28292C")),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 0, right: 0, top: 10),
                                    child: TextField(
                                      controller: ConfirmPassword_Controller,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'Confirm password'.toUpperCase(),
                                        hintStyle: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                        filled: true,
                                        fillColor: HexColor("28292C"),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("28292C")),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: HexColor("28292C")),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onDoubleTap: () {
                                          dashbordCubit.PasswordChange(
                                              CurrentPassword_Controller.text,
                                              NewPassword_Controller.text,
                                              ConfirmPassword_Controller.text);

                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 140,
                                          height: 50,
                                          color: HexColor("28292C"),
                                          child: Center(
                                              child: Text(
                                            "Change Password",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                          )),
                                        ),
                                      ),
                                      Expanded(child: SizedBox())
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.amber,
                        child: Center(
                          child: Text("Change Password"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print("hello");
                        setState(() {
                          pd = 1;
                        });
                      },
                      child: Container(
                        color: Colors.red,
                        child: Center(
                          child: Text("Edit Profile".toUpperCase()),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              padding: EdgeInsets.all(10),
              height: 50,
              child: Row(
                children: [
                  CheersClubText(
                    text: "Personal Details",
                    fontColor: Colors.white,
                    fontSize: 20,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30),
              child: Divider(
                height: 1,
                thickness: 1,
                color: Colors.amber,
              ),
            ),
            screensPd(pd)
          ],
        ),
      ),
    );
  }

  Widget personal() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: user?.name!,
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: "" + "${user?.address}",
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: "" + "${user?.email!}",
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: "" + "${user?.phone.toString()}",
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: "Invoice address",
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: "" + "${user?.country}" + "${(user?.zip)}",
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              children: [
                CheersClubText(
                  text: "" + "${user?.country}",
                  fontColor: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Editprofile() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: CheersClubText(
              text: "Full name",
              fontColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 4),
            child: TextField(
              controller: txt_fullname_Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                filled: true,
                fillColor: HexColor("28292C"),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: CheersClubText(
              text: "Address",
              fontColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 4),
            child: TextField(
              controller: txt_address_Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                filled: true,
                fillColor: HexColor("28292C"),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: CheersClubText(
              text: "Phone no",
              fontColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 4),
            child: TextField(
              controller: txt_Phoneno_Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                filled: true,
                fillColor: HexColor("28292C"),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: CheersClubText(
              text: "Zip code",
              fontColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 4),
            child: TextField(
              controller: txt_zip_Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                filled: true,
                fillColor: HexColor("28292C"),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: CheersClubText(
              text: "Invoice Address",
              fontColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 4),
            child: TextField(
              controller: txt_Country_Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                filled: true,
                fillColor: HexColor("28292C"),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
            margin: EdgeInsets.only(left: 30, right: 30, top: 20),
            child: CheersClubText(
              text: "Country",
              fontColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, right: 30, top: 4),
            child: TextField(
              controller: txt_city_Controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '',
                hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                filled: true,
                fillColor: HexColor("28292C"),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
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
          GestureDetector(
            onTap: () {
              dashbordCubit.UserProfileupdate(
                txt_fullname_Controller.text,
                txt_address_Controller.text,
                txt_Phoneno_Controller.text,
                txt_zip_Controller.text,
                txt_Country_Controller.text,
                txt_city_Controller.text,
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 40),
              padding: EdgeInsets.all(10),
              height: 58,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.amber,
                    child: Center(
                      child: Text("Save Profile".toUpperCase()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int pd = 0;
  screensPd(int no) {
    switch (no) {
      case 0:
        return personal();
      case 1:
        return Editprofile();
    }
  }

  screens(int no) {
    switch (no) {
      case 0:
        return myoders();
      case 1:
        return mygreetings();
      case 2:
        profileLoding();
        return myprofile();
        break;
    }
  }

  void profileLoding() {
    dashbordCubit.UserProfileloading();
  }

  User? user;

  List<MyGreetings> greetingListdata = [];
  void GreetingsLoading() {
    dashbordCubit.getGreetings();
  }

  List<MyGreetings> OrderListdata = [];
  void OrdersLoading() {
    dashbordCubit.getOrders();
  }



 


  @override
  void initState() {
    dashbordCubit = DashbordCubit(DashBordRepository());
    // TODO: implement initState
    OrdersLoading();
    super.initState();
  }

  @override
  void dispose() {
    CurrentPassword_Controller.dispose();
    NewPassword_Controller.dispose();
    ConfirmPassword_Controller.dispose();
    txt_fullname_Controller.dispose();
    txt_address_Controller.dispose();
    txt_Phoneno_Controller.dispose();
    txt_zip_Controller.dispose();
    txt_Country_Controller.dispose();
    txt_city_Controller.dispose();

    // TODO: implement dispose
    super.dispose();
  }

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
      body: Container(
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
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 1000),
                              type: PageTransitionType.rightToLeft,
                              child: RestourentList(),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: HexColor("FEC753"),
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(left: 30, top: 20, right: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_sharp,
                              size: 16,
                            ),
                            CheersClubText(
                              text: "Place an order",
                              fontColor: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (my_oders) {
                      no = 0;
                      my_greetings = false;
//                      my_oders = false;
                      my_profile = false;
                    } else {
                      no = 0;
                      my_oders = true;
                      my_profile = false;
                      my_greetings = false;
                    }
                  });
                  OrdersLoading();
                  /*
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rightToLeft,
                        child: Home(),
                        inheritTheme: true,
                        ctx: context),
                  );
                */
                },
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        color:
                            my_oders ? HexColor("FEC753") : HexColor("5D5D5E"),
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Center(
                          child: const CheersClubText(
                            text: "MY ORDERS",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (my_greetings) {
                      no = 1;
                      //  my_greetings = false;
                      my_oders = false;
                      my_profile = false;
                    } else {
                      no = 1;
                      my_greetings = true;

                      my_profile = false;
                      my_oders = false;
                    }
                  });
                  GreetingsLoading();
                  /*
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rightToLeft,
                        child: Home(),
                        inheritTheme: true,
                        ctx: context),
                  );
                */
                },
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        color: my_greetings
                            ? HexColor("FEC753")
                            : HexColor("5D5D5E"),
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Center(
                          child: const CheersClubText(
                            text: "MY GREETINGS",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (my_profile) {
                      my_greetings = false;
                      my_oders = false;
                      no = 2;
//                      my_profile = false;

                    } else {
                      no = 2;
                      my_profile = true;
                      my_greetings = false;
                      my_oders = false;
//
                    }
                  });
                  profileLoding();
                  /*
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rightToLeft,
                        child: Home(),
                        inheritTheme: true,
                        ctx: context),
                  );
                */
                },
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        color: my_profile
                            ? HexColor("FEC753")
                            : HexColor("5D5D5E"),
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Center(
                          child: const CheersClubText(
                            text: "MY PROFILE",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                //            height: 500,
                child: Expanded(
                  child: BlocProvider(
                      create: (context) => dashbordCubit,
                      child: BlocListener<DashbordCubit, DashbordState>(
                        bloc: dashbordCubit,
                        listener: (context, state) {
                          if (state is DashbordLoading) {
                          } else if (state is DashbordLoadingMyorders) {
                          } else if (state
                              is DashbordLoadingMyordersSucssellfull) {
                            OrderListdata = state.ordersListdata;
                          } else if (state is DashbordMyProfileLoading) {
                          } else if (state is DashbordMyProfileSuccessFull) {
                            pd = 0;
                            user = state.user;
                            print("user loadded");
                          } else if (state is DashbordMyGreetingsLoading) {
                          } else if (state is DashbordMyGreetingsSuccessFull) {
                            greetingListdata = state.ordersListdata;
                          } else if (state is DashbordMyGreetingsFail) {
                            Utils.showDialouge(context, AlertType.error,
                                "No data", state.error);
                          } else if (state is DashbordchangePasswordLoading) {
                          } else if (state
                              is DashbordchangePasswordSuccessFull) {
                            Fluttertoast.showToast(
                                msg: "Password Changing is Succesfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.amberAccent,
                                textColor: Colors.white,
                                fontSize: 16.0);

                            Navigator.push(
                              context,
                              PageTransition(
                                  duration: Duration(milliseconds: 1000),
                                  type: PageTransitionType.rightToLeft,
                                  child: LoginScreen(),
                                  inheritTheme: true,
                                  ctx: context),
                            );
                          } else if (state is DashbordchangePasswordFail) {
                            Utils.showDialouge(context, AlertType.error,
                                "No data", state.message);
                          }
                        },
                        child: BlocBuilder<DashbordCubit, DashbordState>(
                            builder: (context, state) {
                          if (state is DashbordMyProfileSuccessFull) {
                            return myprofile();
                          } else if (state is DashbordMyGreetingsSuccessFull) {
                            return mygreetings();
                          } else if (state
                              is DashbordLoadingMyordersSucssellfull) {
                            return myoders();
                          } else {
                            return Container(
                                //                             color: Colors.white,
                                );
                          }
                        }),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
