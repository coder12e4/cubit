import 'package:cheersclub/Utils/utils.dart';
import 'package:cheersclub/cubit/auth/login/login_cubit.dart';
import 'package:cheersclub/cubit/repository/LoginRepository.dart';
import 'package:cheersclub/pages/Home.dart';
import 'package:cheersclub/pages/registration_screen.dart';
import 'package:cheersclub/widgets/CheersAlert.dart';
import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:cheersclub/widgets/drowers/drowers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

import 'forgetPassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var Username_Controller = TextEditingController();
  var Password_Controller = TextEditingController();
  String? _password = "";
  String? _username = "";
  bool _isObscure = true;
  bool value = false;
  GlobalKey<ScaffoldState>? _key = GlobalKey();
  late LoginCubit loginCubit;
  @override
  void initState() {
    // TODO: implement initState
    loginCubit = LoginCubit(UserLoginRepository());
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Username_Controller.dispose();
    Password_Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      Container(
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
              GestureDetector(
                child: Container(
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
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rightToLeft,
                        child: settings(),
                        inheritTheme: true,
                        ctx: context),
                  );
                },
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
      )
      */
      key: _key,
      endDrawer: drowerBeforlogin(),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
          create: (context) => loginCubit,
          child: BlocListener<LoginCubit, LoginState>(
            bloc: loginCubit,
            listener: (context, state) {
              if (state is LoginLoading) {}
              if (state is LoginSuccessFull) {
                Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 1000),
                      type: PageTransitionType.rightToLeft,
                      child: Home(),
                      inheritTheme: true,
                      ctx: context),
                );
              } else if (state is LoginFailed) {
                Utils.showDialouge(
                    context, AlertType.error, "Oops!", state.msg);
              }
            },
            child:
                BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
              return loginform();
            }),
          )),
    );
  }

  Widget loginform() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: HexColor("1A1B1D"),
      child: SingleChildScrollView(
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
                              _key!.currentState!.openEndDrawer();
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
                margin: EdgeInsets.only(left: 30, top: 30),
                child: const CheersClubText(
                  text: "Login",
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
                      text: "New user?",
                      fontColor: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    GestureDetector(
                      child: const CheersClubText(
                        text: " Create an account",
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
                              child: Registration_screen(),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextField(
                  controller: Username_Controller,
                  onChanged: (val) {
                    _username = val;
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'E-mail',
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
                  obscureText: _isObscure,
                  onChanged: (VAL) {
                    setState(() {
                      _password = VAL;
                    });
                  },
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        }),
                    border: InputBorder.none,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white, fontSize: 14),
                    filled: true,
                    fillColor: HexColor("28292C"),
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 0.0, top: 8.0),
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
                margin: EdgeInsets.only(left: 20, right: 30, top: 20),
                child: Row(
                  children: [
                    Checkbox(
                      activeColor: HexColor("FEC753"),
                      side: BorderSide(color: Colors.white),
                      checkColor: Colors.white,
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 0),
                      child: const CheersClubText(
                        text: "Remember Login",
                        fontColor: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  login();
                },
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Container(
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
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        duration: Duration(milliseconds: 1000),
                        type: PageTransitionType.rightToLeft,
                        child: forgetPassword(),
                        inheritTheme: true,
                        ctx: context),
                  );
                },
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        //color: HexColor("FEC753"),
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Center(
                          child: const CheersClubText(
                            text: "Forgot Password",
                            fontColor: Colors.amber,
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

  void login() {
    loginCubit.authenticateUser(
        Username_Controller.text, Password_Controller.text);
  }
}
