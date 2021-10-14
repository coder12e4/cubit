import 'package:cheersclub/Utils/utils.dart';
import 'package:cheersclub/cubit/auth/registration/register_cubit.dart';
import 'package:cheersclub/cubit/repository/RegistrationRepository.dart';
import 'package:cheersclub/pages/LoginScreen.dart';
import 'package:cheersclub/widgets/CheersAlert.dart';
import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

class Registration_screen extends StatefulWidget {
  const Registration_screen({Key? key}) : super(key: key);
  @override
  _Registration_screenState createState() => _Registration_screenState();
}

class _Registration_screenState extends State<Registration_screen> {
  var Username_Controller = TextEditingController();
  var Email_Controller = TextEditingController();
  var Password_Controller = TextEditingController();
  var confirm_password_Controller = TextEditingController();
  bool value = false;
  bool value_bussiness = false;
  int? typeUser = 0;

  GlobalKey<ScaffoldState> _key = GlobalKey();
  late RegisterCubit registerCubit;

  @override
  void initState() {
    registerCubit = RegisterCubit(UserRegRepository());
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    Username_Controller.dispose();
    Email_Controller.dispose();
    Password_Controller.dispose();
    confirm_password_Controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: Container(
          decoration: BoxDecoration(
              color: HexColor("1A1B1D"),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 30,
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
                Container(
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
        body: BlocProvider(
            create: (context) => registerCubit,
            child: BlocListener<RegisterCubit, RegisterState>(
              bloc: registerCubit,
              listener: (context, state) {
                if (state is RegistrationLoading) {}
                if (state is RegistrationLoginSuccessFull) {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rightToLeft,
                        child: LoginScreen(),
                        inheritTheme: true,
                        ctx: context),
                  );
                } else if (state is RegistrationFailed) {
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.msg);
                }
              },
              child: BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                return Form(key: _key, child: registraton());
              }),
            )));
  }

  Widget registraton() {
    return Container(
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
                            margin: EdgeInsets.only(right: 20, top: 40),
                            child: Image.asset(
                              "assets/images/nav.png",
                              height: 20,
                              width: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 30),
                child: const CheersClubText(
                  text: "Create an Account",
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CheersClubText(
                      text: "Already have an account?",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    GestureDetector(
                      child: const CheersClubText(
                        text: " Login",
                        fontColor: Colors.amberAccent,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 1000),
                              type: PageTransitionType.rightToLeft,
                              child: LoginScreen(),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30,
                  top: 20,
                ),
                width: MediaQuery.of(context).size.width - 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CheersClubText(
                      text: "Customer type",
                      fontColor: Colors.amber,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 30, top: 0),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: HexColor("FEC753"),
                      side: BorderSide(color: Colors.amber),
                      checkColor: Colors.white,
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          typeUser = 0;
                          this.value_bussiness = false;
                          this.value = value!;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 0),
                      child: const CheersClubText(
                        text: "Private",
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
                          typeUser = 1;
                          this.value = false;
                          this.value_bussiness = value!;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 0),
                      child: const CheersClubText(
                        text: "Bussiness",
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: Username_Controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'User Name',
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
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: Email_Controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Email',
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
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextField(
                  controller: Password_Controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
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
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextField(
                  controller: confirm_password_Controller,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Confirm password',
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
                height: 60,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Register();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        color: HexColor("FEC753"),
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Center(
                          child: const CheersClubText(
                            text: "Continue",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 20),
                child: const CheersClubText(
                  text: "Or Login With",
                  fontColor: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              Container(
                height: 60,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Image.asset(
                              "assets/images/google.png",
                              height: 36,
                              width: 36,
                              fit: BoxFit.contain,
                            ),
                          ),
                          CheersClubText(
                            text: "Google",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      color: HexColor("3A559F"),
                      margin: EdgeInsets.only(left: 30, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Image.asset(
                              "assets/images/fb.png",
                              height: 36,
                              width: 36,
                              fit: BoxFit.contain,
                            ),
                          ),
                          CheersClubText(
                            text: "Facebook",
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      color: HexColor("ED58C0"),
                      margin: EdgeInsets.only(left: 30, top: 10, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: Image.asset(
                              "assets/images/insta.png",
                              height: 36,
                              width: 36,
                              fit: BoxFit.contain,
                            ),
                          ),
                          CheersClubText(
                            text: "Instagram",
                            fontColor: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Register() {
    registerCubit.authenticateUser(
        Username_Controller.text,
        Email_Controller.text,
        typeUser,
        Password_Controller.text,
        confirm_password_Controller.text);
  }
}
