import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/auth/registration_cubit.dart';
import 'package:vfuel/cubit/repository/user_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_appbar.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

class VerifyOTP extends StatefulWidget {
  @override
  _VerifyOTPState createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  late RegistrationCubit _registrationCubit;
  TextEditingController? textEditingController;
  String _otp = "";
  @override
  void initState() {
    super.initState();
    _registrationCubit = RegistrationCubit(
        UserRegistrationRepository(), UserMobileVeificationInitial());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
            create: (context) => _registrationCubit,
            child: BlocListener<RegistrationCubit, RegistrationState>(
              bloc: _registrationCubit,
              listener: (context, state) {
                if (state is UserMobileVeificationInProgress) {
                  Utils.showLoadingIndicator(context);
                } else if (state is UserMobileVeificationSuccess) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                    context,
                    AlertType.success,
                    "Success!",
                    "Verification Completed, Please login using your credentials",
                    okButtonText: "Ok",
                    okButtonCallBack: () {
                      vfuelRouter.navigateTo(context, Screen.Login);
                    },
                  );
                } else if (state is UserMobileVeificationError) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                }
              },
              child: BlocBuilder<RegistrationCubit, RegistrationState>(
                  builder: (context, state) {
                return otpVerificationForm();
              }),
            )));
  }

  void verifyPhone() async {
    if (_otp.length < 6) {
      return;
    }
    User? user = await UserManager.instance.getUser();
    if (user != null) {
      _registrationCubit.verifyMobile(user.phone, _otp);
    }
  }

  Widget otpVerificationForm() {
    return SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          vfuelCustomAppBar(),
          SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(34),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
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
                SizedBox(height: 20),
                vfuelText(
                  text:
                      "Please enter the verification code send to your Mobile Number",
                  fontSize: 15,
                  fontColor: vfuelColors.GreyTextColor,
                  alignment: TextAlign.start,
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
                SizedBox(
                  height: 40.0,
                ),
                vfuelButton(
                    title: "Verify",
                    gradient: vfuelColors.buttonOrangeGradient,
                    textColor: Colors.white,
                    cornerRadius: 10,
                    onPressed: () {
                      verifyPhone();
                    }),
                SizedBox(
                  height: 20,
                ),
                // Container(
                //   width: double.infinity,
                //   height: 50,
                //   child: TextButton(
                //       onPressed: () {
                //         vfuelRouter.navigateTo(context, Screen.Login);
                //       },
                //       child: Text(
                //         "Skip",
                //         style: TextStyle(
                //             color: vfuelColors.buttonLighGreyTextColor),
                //         textAlign: TextAlign.center,
                //       )),
                // )
              ],
            ),
          ))
        ]));
  }
}
