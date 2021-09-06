import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/styles.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/auth/login_cubit.dart';
import 'package:vfuel/cubit/repository/login_repository.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _password = "";
  String? _username = "";

  late LoginCubit _loginCubit;
  GlobalKey<FormState> _key = new GlobalKey();

  @override
  void initState() {
    _loginCubit = LoginCubit(UserLoginRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => _loginCubit,
            child: BlocListener<LoginCubit, LoginState>(
              bloc: _loginCubit,
              listener: (context, state) {
                if (state is LoginLoading) {
                  Utils.showLoadingIndicator(context);
                }
                if (state is LoginSuccessfull) {
                  Utils.dismissLoadingIndicator(context);
                  vfuelRouter.navigateTo(context, Screen.Home);
                } else if (state is LoginFailed) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                }
              },
              child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                return Form(key: _key, child: loginForm());
              }),
            )));
  }

  Widget loginForm() {
    return SingleChildScrollView(
        child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(0.0, 18.0, 24.0, 0.0),
            child: Image.asset(
              "assets/images/logo_icon.png",
              height: 78.0,
              width: 65.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 25.0, 30.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                vfuelText(
                  text: "Hi,",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                vfuelText(
                  text: "Welcome back!",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Container(
                        height: 60.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE6E6E6),
                          ),
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                        child: TextFormField(
                          validator: vfuelValidators.userNameValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          style: vfuelStyles.formTextStyle(),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'User ID',
                              hintStyle: TextStyle(
                                color: Color(0xff95A0B6),
                                fontFamily: "Poppins Regular",
                                fontSize: 14.0,
                              )),
                          onSaved: (String? val) {
                            _username = val;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Container(
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Color(0xffE6E6E6),
                            ),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: TextFormField(
                            style: vfuelStyles.formTextStyle(),
                            validator: vfuelValidators.passwordValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  color: Color(0xff95A0B6),
                                  fontFamily: "Poppins Regular",
                                  fontSize: 14.0,
                                )),
                            obscureText: true,
                            onSaved: (String? val) {
                              _password = val;
                            },
                          )),
                    ),
                    SizedBox(
                      height: 13.0,
                    ),
                    Container(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            vfuelRouter.navigateTo(
                                context, Screen.ForgotPassword);
                          },
                          child: Text(
                            "Forgot password?",
                            style: TextStyle(
                                color: vfuelColors.PrimaryTextColor,
                                fontSize: 14),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: vfuelButton(
                  cornerRadius: 5,
                  gradient: vfuelColors.buttonOrangeGradient,
                  title: "LOGIN",
                  textColor: Colors.white,
                  onPressed: () {
                    login();
                  })),
          SizedBox(
            height: 40.0,
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Don't have account?",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Poppins Regular",
                      fontSize: 15.0,
                      color: Color(0xff020433),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      vfuelRouter.navigateTo(context, Screen.Registration);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: "Poppins Regular",
                          fontSize: 15.0,
                          color: Color(0xff74B42F),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                child: Text(
                  "You must get a confirmation SMS from the\nFuel Admin team to enable the Login.",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 10.0,
                    color: Color(0xff464646),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    ));
  }

  void login() {
    final isValid = _key.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key.currentState!.save();

    _loginCubit.authenticateUser(_username, _password);
  }
}
