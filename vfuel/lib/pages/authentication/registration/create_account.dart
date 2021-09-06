import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/strings.dart';
import 'package:vfuel/Utils/styles.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/auth/registration_cubit.dart';
import 'package:vfuel/cubit/repository/user_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/districts.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_appbar.dart';
import 'package:vfuel/widgets/vfuel_button.dart';

class CreateAccountScreen extends StatefulWidget {
  final RegistrationCubit? registrationCubit;

  const CreateAccountScreen({Key? key, this.registrationCubit})
      : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  String? _name;
  String? _address;
  String? _email;
  String? _phone;
  String? _password;
  String? _businessName;
  int? _pincode;
  String? _gstin;
  String? _partnerCode = "";
  final FocusNode _nodeNumberType = FocusNode();

  List<District> districts = [];
  District? selectedDistrict;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> _key = new GlobalKey();
  late RegistrationCubit _registrationCubit;

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: _nodeNumberType,
            onTapAction: () {},
          ),
        ]);
  }

  @override
  void initState() {
    _registrationCubit = RegistrationCubit(
        UserRegistrationRepository(), UserRegistrationInitial());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: vfuelAppBar(""),
        body: KeyboardActions(
            config: _buildConfig(context),
            child: BlocProvider(
                create: (context) => _registrationCubit,
                child: BlocListener<RegistrationCubit, RegistrationState>(
                  bloc: _registrationCubit,
                  listener: (context, state) {
                    if (state is DistrictsLoading ||
                        state is UserRegistrationInProgresss) {
                      Utils.showLoadingIndicator(context);
                    } else if (state is DistrictsFetchedSuccessfully) {
                      District select = District(
                        name: 'Select option',
                        districtId: 'Select',
                        countryId: 'Select',
                        stateId: 'Select',
                        createdAt: 'Select',
                        updatedAt: 'Select',
                        iV: 5,
                        status: 'Select',
                      );
                      Utils.dismissLoadingIndicator(context);
                      districts = state.districts;
                      districts.add(select);
                      selectedDistrict = select;
                    } else if (state is UserRegistrationCompleted) {
                      Utils.dismissLoadingIndicator(context);
                      Utils.showDialouge(
                        context,
                        AlertType.success,
                        "Verification Mail sent",
                        "A verification mail has been sent to your mail ID",
                        okButtonText: "OK",
                        okButtonCallBack: () {
                          Navigator.pop(context, 'Ok');
                          vfuelRouter.navigateTo(context, Screen.VeifyOTP);
                        },
                      );
                    } else if (state is UserRegistrationError) {
                      Utils.dismissLoadingIndicator(context);
                      Utils.showDialouge(
                          context,
                          AlertType.error,
                          "Oops!",
                          state.error == null
                              ? vfuelStrings.commonErrorMesage
                              : state.error);
                    } else if (state is DistrictsFetchFailed) {
                      Utils.dismissLoadingIndicator(context);
                      Utils.showDialouge(
                          context, AlertType.error, "Oops!", state.error);
                    } else if (state is InvalidPartnerCodeError) {
                      Utils.dismissLoadingIndicator(context);
                      showInvalidPartnerCodeAlert(state.errorMessage);
                    }
                  },
                  child: BlocBuilder<RegistrationCubit, RegistrationState>(
                      builder: (context, state) {
                    if (state is UserRegistrationInitial) {
                      _registrationCubit.getDistricts();
                    }
                    return Form(key: _key, child: signUpForm());
                  }),
                ))));
  }

  void showInvalidPartnerCodeAlert(String message) {
    Utils.showDialouge(
      context,
      AlertType.error,
      "Invalid Partner Code",
      "Kindly verify with Partner or do you want to proceed without a partner code",
      cancelButtonText: "Cancel",
      okButtonText: "Yes, Proceed",
      okButtonCallBack: () {
        Navigator.pop(context, 'Ok');
        _partnerCode = "";
        createAccount(true);
      },
    );
  }

  void createAccount(bool isPartnerCodeEmpty) {
    final isValid = _key.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key.currentState!.save();

    if (isPartnerCodeEmpty) {
      _partnerCode = "";
    }
    User user = User(
        name: _name,
        address: _address,
        email: _email,
        phone: _phone,
        password: _password,
        gstin: _gstin,
        businessName: _businessName,
        pincode: _pincode,
        districtId: selectedDistrict!.districtId,
        code: _partnerCode);

    _registrationCubit.registerNewUser(user);
  }

  Widget signUpForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "Create an Account",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Poppins Bold",
              fontSize: 20.0,
              color: Color(0xff024260),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact Person Name",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.noneEmptyValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (String? val) {
                        _name = val;
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Phone Number",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.mobileNumberValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                      onSaved: (String? val) {
                        _phone = val;
                      },
                      focusNode: _nodeNumberType,
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.emailValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? val) {
                        _email = val;
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.passwordValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _passwordController,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      obscureText: true,
                      onSaved: (String? val) {
                        _password = val;
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirm Password",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'This field is required';
                        }

                        if (value != _passwordController.text) {
                          return 'Please enter the same value again';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _confirmPasswordController,
                      obscureText: true,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
          Text(
            "Business Information",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Poppins Bold",
              fontSize: 16.0,
              color: Color(0xff282A52),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Partner Code",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (String? val) {
                        _partnerCode = val;
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "GSTIN",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (String? val) {
                        _gstin = val;
                      },
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Business entity name",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.noneEmptyValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (String? val) {
                        _businessName = val;
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.noneEmptyValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (String? val) {
                        _address = val;
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "District",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                    child: DropdownButtonFormField<District>(
                      decoration:
                          InputDecoration(enabledBorder: InputBorder.none),
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      value: selectedDistrict,
                      style: vfuelStyles.formTextStyle(),
                      onChanged: (value) {
                        selectedDistrict = value;
                      },
                      items: districts
                          .map<DropdownMenuItem<District>>((District value) {
                        return DropdownMenuItem<District>(
                          value: value,
                          child: Text(value.name!),
                        );
                      }).toList(),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pin Code",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 11.0,
                    color: Color(0xff404B69),
                  ),
                ),
                SizedBox(
                  height: 3.0,
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
                      validator: vfuelValidators.pincodeValidator,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: vfuelStyles.formTextStyle(),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (String? val) {
                        _pincode = int.parse(val!);
                      },
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 50.0,
            alignment: Alignment.center,
            child: vfuelButton(
                cornerRadius: 5,
                gradient: vfuelColors.buttonOrangeGradient,
                title: "CONTINUE",
                textColor: Colors.white,
                onPressed: () {
                  createAccount(false);
                }),
          ),
          SizedBox(
            height: 22.0,
          ),
          Text(
            "By creating an account you agree to our\nTerms of Service and Privacy Policy",
            style: TextStyle(
              decoration: TextDecoration.none,
              fontFamily: "Poppins Regular",
              fontSize: 12.0,
              color: Color(0xff464646),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            height: 50.0,
            color: Color(0xffDBDCDD),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins Regular",
                    fontSize: 14.0,
                    color: Color(0xff024260),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Poppins Bold",
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff024260),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
