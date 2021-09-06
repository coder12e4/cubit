import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/styles.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/auth/forgot_password_cubit.dart';
import 'package:vfuel/cubit/repository/forgot_password_repository.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

import 'forgot_passsword_verify.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late ForgotPasswordCubit _forgotPasswordCubit;
  GlobalKey<FormState> _key = new GlobalKey();
  String? _userName;
  @override
  void initState() {
    _forgotPasswordCubit = ForgotPasswordCubit(UserForgotPasswordRepository());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => _forgotPasswordCubit,
            child: BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
              bloc: _forgotPasswordCubit,
              listener: (context, state) {
                if (state is ForgotPasswordLoading) {
                  Utils.showLoadingIndicator(context);
                } else if (state
                    is ForgotPassworRequestdSuccessfullyWithEmail) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context,
                      AlertType.success,
                      "Reset Password Mail sent",
                      state.successMessage, okButtonCallBack: () {
                    vfuelRouter.navigateTo(context, Screen.Login);
                  });
                } else if (state is ForgotPassworRequestdSuccessfull) {
                  Utils.dismissLoadingIndicator(context);
                  navigateToVerification();
                } else if (state is ForgotPassworRequestFailed) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                }
              },
              child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                return Form(key: _key, child: forgotPasswordForm());
              }),
            )));
  }

  void forgotPasswordOTPRequest() {
    if (!_key.currentState!.validate()) {
      return;
    }
    _key.currentState!.save();
    _forgotPasswordCubit.forgotPasswordRequest(_userName);
  }

  void navigateToVerification() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PasswordVerification(userName: _userName)));
  }

  Widget forgotPasswordForm() {
    return SafeArea(
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
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.all(34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vfuelText(
                  text: "Forgot Password?",
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                vfuelText(
                  text: "Sign in to your account",
                  fontSize: 15,
                  fontColor: vfuelColors.GreyTextColor,
                ),
                SizedBox(
                  height: 45,
                ),
                Container(
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Color(0xffE6E6E6),
                      ),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 70.0,
                          width: 50,
                          decoration: BoxDecoration(
                              color: vfuelColors.LightGreyBGColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              )),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12, right: 12),
                            child: Icon(
                              Icons.person_outline_outlined,
                              color: vfuelColors.DarkGreyTextColor,
                              size: 30,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: TextFormField(
                          style: vfuelStyles.formTextStyle(),
                          validator: vfuelValidators.userNameValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Enter Email id or Phone Number",
                              hintStyle: TextStyle(
                                color: Color(0xff95A0B6),
                                fontFamily: "Poppins Regular",
                                fontSize: 14.0,
                              )),
                          onSaved: (String? val) {
                            _userName = val;
                          },
                        ))
                      ],
                    )),
                SizedBox(
                  height: 40,
                ),
                Container(
                  alignment: FractionalOffset.center,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: vfuelButton(
                            cornerRadius: 6,
                            gradient: vfuelColors.buttonOrangeGradient,
                            title: "Submit",
                            textColor: Colors.white,
                            onPressed: () {
                              forgotPasswordOTPRequest();
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * .01)),
                      Container(
                          width: MediaQuery.of(context).size.width * .4,
                          child: vfuelButton(
                            cornerRadius: 6,
                            gradient: vfuelColors.alertButtonGreyGradient,
                            textColor: vfuelColors.DarkGreyTextColor,
                            title: "Cancel",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
