//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/styles.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/widgets/vfuel_button.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  bool isEditClicked = true;
  String? _name, _email, _subject, _message;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            "assets/images/logo_with_text.png",
            height: 71,
            width: 153,
          )
        ]),
        SingleChildScrollView(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    color: vfuelColors.silverBgColor,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffE6E6E6),
                                        ),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: TextFormField(
                                        style: vfuelStyles.formTextStyle(),
                                        validator:
                                            vfuelValidators.noneEmptyValidator,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Your Name',
                                            hintStyle: TextStyle(
                                              color: Color(0xff95A0B6),
                                              fontFamily: "Poppins Regular",
                                              fontSize: 14.0,
                                            )),
                                        onSaved: (String? val) {
                                          _name = val;
                                        },
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffE6E6E6),
                                        ),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: TextFormField(
                                        style: vfuelStyles.formTextStyle(),
                                        validator:
                                            vfuelValidators.noneEmptyValidator,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Your Email',
                                            hintStyle: TextStyle(
                                              color: Color(0xff95A0B6),
                                              fontFamily: "Poppins Regular",
                                              fontSize: 14.0,
                                            )),
                                        onSaved: (String? val) {
                                          _email = val;
                                        },
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                      width: double.infinity,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffE6E6E6),
                                        ),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: TextFormField(
                                        style: vfuelStyles.formTextStyle(),
                                        validator:
                                            vfuelValidators.noneEmptyValidator,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Subject',
                                            hintStyle: TextStyle(
                                              color: Color(0xff95A0B6),
                                              fontFamily: "Poppins Regular",
                                              fontSize: 14.0,
                                            )),
                                        onSaved: (String? val) {
                                          _subject = val;
                                        },
                                      ))),
                              Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Container(
                                      width: double.infinity,
                                      height: 200.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffE6E6E6),
                                        ),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      padding: EdgeInsets.fromLTRB(
                                          15.0, 0.0, 15.0, 0.0),
                                      child: TextFormField(
                                        style: vfuelStyles.formTextStyle(),
                                        validator:
                                            vfuelValidators.noneEmptyValidator,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Message',
                                            hintStyle: TextStyle(
                                              color: Color(0xff95A0B6),
                                              fontFamily: "Poppins Regular",
                                              fontSize: 14.0,
                                            )),
                                        onSaved: (String? val) {
                                          _name = val;
                                        },
                                      )))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 20, bottom: 60),
                                child: Container(
                                    height: 60,
                                    child: vfuelButton(
                                        title: "Send Message",
                                        width: 200,
                                        cornerRadius: 10,
                                        gradient:
                                            vfuelColors.buttonOrangeGradient,
                                        textColor: Colors.white)))
                          ],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ))
      ],
    )));
  }

  //Widget showEmptyView() {}
}
