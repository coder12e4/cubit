import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/styles.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/auth/profile_cubit.dart';
import 'package:vfuel/cubit/repository/profile_repository.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

class ChangePassowordView extends StatefulWidget {
  final BuildContext? alertContext;

  const ChangePassowordView({Key? key, this.alertContext}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _ChangePassowordViewState();
  }
}

class _ChangePassowordViewState extends State<ChangePassowordView> {
  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;
  GlobalKey<FormState> _key = new GlobalKey();
  late ProfileCubit _profileCubit;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void initState() {
    super.initState();
    _profileCubit = ProfileCubit(UserProfileRepository());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _profileCubit,
        child: BlocListener<ProfileCubit, ProfileState>(
            bloc: _profileCubit,
            listener: (context, state) {
              if (state is ChangePasswordLoading) {
                Utils.showLoadingIndicator(context);
              } else if (state is ChangePasswordSuccessful) {
                Utils.dismissLoadingIndicator(context);
                Utils.showDialouge(context, AlertType.success, "Success",
                    "Your Password updated successfully", okButtonCallBack: () {
                  Navigator.pop(widget.alertContext!);
                });
              } else if (state is ChangePasswordFailed) {
                Utils.dismissLoadingIndicator(context);
                Utils.showDialouge(
                    context, AlertType.error, "Oops!", state.error);
              }
            },
            child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
              return Dialog(
                  elevation: 0,
                  child: Container(child: changePasswordWidget()));
            })));
  }

  Widget changePasswordWidget() {
    return SingleChildScrollView(
        child: Form(
            key: _key,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      vfuelText(
                        text: "Reset password",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontColor: vfuelColors.blackTextColor,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(widget.alertContext!);
                          },
                          icon: Icon(Icons.close))
                    ],
                  ),
                  Divider(
                    height: 5,
                    color: vfuelColors.greyTextColor,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vfuelText(
                        text: "Current Password",
                        alignment: TextAlign.start,
                      ),
                      Container(
                          height: 50.0,
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
                                hintStyle: TextStyle(
                                  color: Color(0xff95A0B6),
                                  fontFamily: "Poppins Regular",
                                  fontSize: 14.0,
                                )),
                            onSaved: (String? val) {
                              _oldPassword = val;
                            },
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      vfuelText(
                        text: "New Password",
                        alignment: TextAlign.start,
                      ),
                      Container(
                          height: 50.0,
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
                            controller: _passwordController,
                            style: vfuelStyles.formTextStyle(),
                            validator: vfuelValidators.passwordValidator,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Color(0xff95A0B6),
                                  fontFamily: "Poppins Regular",
                                  fontSize: 14.0,
                                )),
                            onSaved: (String? val) {
                              _newPassword = val;
                            },
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        vfuelText(
                          text: "Confirm New Password",
                        ),
                        Container(
                            height: 50.0,
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
                                controller: _confirmPasswordController,
                                style: vfuelStyles.formTextStyle(),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is required';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Confirm password does not match the entered password';
                                  }
                                  return null;
                                },
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      color: Color(0xff95A0B6),
                                      fontFamily: "Poppins Regular",
                                      fontSize: 14.0,
                                    )),
                                onSaved: (String? val) {})),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: vfuelButton(
                                cornerRadius: 5,
                                gradient: vfuelColors.buttonOrangeGradient,
                                title: "UPDATE PASSWORD",
                                textColor: Colors.white,
                                onPressed: () {
                                  changePassword();
                                })),
                        SizedBox(
                          height: 40,
                        ),
                      ])
                ])))));
  }

  void changePassword() {
    final isValid = _key.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key.currentState!.save();
    _profileCubit.changePassword(_oldPassword, _newPassword);
  }
}
