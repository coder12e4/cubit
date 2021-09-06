import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
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

class PasswordVerification extends StatefulWidget {
  final String? userName;
  const PasswordVerification({Key? key, this.userName}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PassworVerificationdState();
}

class _PassworVerificationdState extends State<PasswordVerification> {
  late ForgotPasswordCubit _forgotPasswordCubit;
  GlobalKey<FormState> _key = new GlobalKey();
  String? _otp;
  String? _password;
  String? _confirmPassword;
  bool obscurePasswordText = true, obscureConfirmPasswordText = true;

  TextEditingController textEditingController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
                if (state is ForgotPasswordVerificationLoading) {
                  Utils.showLoadingIndicator(context);
                } else if (state is ForgotPasswordVerificationSuccessfull) {
                  Utils.dismissLoadingIndicator(context);
                  vfuelRouter.navigateTo(context, Screen.Login);
                } else if (state is ForgotPasswordVerificationFailed) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                    context,
                    AlertType.error,
                    "Oops!",
                    state.error,
                  );
                }
              },
              child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                  builder: (context, state) {
                return Form(key: _key, child: forgotPasswordForm());
              }),
            )));
  }

  void forgotPasswordVerificationRequest() {
    if (!_key.currentState!.validate()) {
      return;
    }
    _key.currentState!.save();

    _forgotPasswordCubit.passwordVerificationRequest(
        widget.userName, _otp, _password);
  }

  void resendOTP() {
    _forgotPasswordCubit.forgotPasswordRequest(widget.userName);
  }

  Widget forgotPasswordForm() {
    return SafeArea(
        child: SingleChildScrollView(
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
            padding: EdgeInsets.only(top: 34, bottom: 16, left: 34, right: 34),
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
                  height: 60,
                ),
                PinCodeTextField(
                  textStyle: TextStyle(color: vfuelColors.DarkGreyTextColor),
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: vfuelColors.DarkGreyTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (v) {
                    if (v!.length < 6) {
                      return "Please enter your OTP";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: false,
                  controller: textEditingController,
                  onCompleted: (v) {},
                  onChanged: (value) {
                    setState(() {
                      _otp = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          resendOTP();
                        },
                        child: vfuelText(
                          text: "Resend OTP",
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
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
                            height: 60.0,
                            width: 50,
                            decoration: BoxDecoration(
                                color: vfuelColors.LightGreyBGColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0),
                                )),
                            child: Center(
                              child: IconButton(
                                icon: Icon(Icons.lock_outline,
                                    color: vfuelColors.DarkGreyTextColor,
                                    size: 25),
                                onPressed: () {
                                  setState(() {
                                    obscurePasswordText = !obscurePasswordText;
                                  });
                                },
                              ),
                            )),
                        SizedBox(width: 10),
                        Flexible(
                            child: TextFormField(
                          controller: passwordController,
                          obscureText: obscurePasswordText,
                          style: vfuelStyles.formTextStyle(),
                          validator: vfuelValidators.passwordValidator,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter your New Password',
                              hintStyle: TextStyle(
                                color: Color(0xff95A0B6),
                                fontFamily: "Poppins Regular",
                                fontSize: 14.0,
                              )),
                          onSaved: (String? val) {
                            _password = val;
                          },
                        ))
                      ],
                    )),
                SizedBox(
                  height: 15,
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
                          height: 60.0,
                          width: 50,
                          decoration: BoxDecoration(
                              color: vfuelColors.LightGreyBGColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              )),
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.lock_outline,
                                  color: vfuelColors.DarkGreyTextColor,
                                  size: 25),
                              onPressed: () {
                                setState(() {
                                  obscureConfirmPasswordText =
                                      !obscureConfirmPasswordText;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                            child: TextFormField(
                          style: vfuelStyles.formTextStyle(),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (passwordController.text == value) {
                              return null;
                            } else {
                              return "Password does not match";
                            }
                          },
                          obscureText: obscureConfirmPasswordText,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Re enter Your Password',
                              hintStyle: TextStyle(
                                color: Color(0xff95A0B6),
                                fontFamily: "Poppins Regular",
                                fontSize: 14.0,
                              )),
                          onSaved: (String? val) {
                            _confirmPassword = val;
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
                          width: MediaQuery.of(context).size.width * .35,
                          child: vfuelButton(
                            cornerRadius: 6,
                            onPressed: () {
                              forgotPasswordVerificationRequest();
                            },
                            gradient: vfuelColors.buttonOrangeGradient,
                            title: "Submit",
                            textColor: Colors.white,
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.001)),
                      Container(
                          width: MediaQuery.of(context).size.width * .35,
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
        ])));
  }
}
