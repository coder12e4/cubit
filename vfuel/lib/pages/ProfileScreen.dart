import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/styles.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/auth/profile_cubit.dart';
import 'package:vfuel/cubit/repository/profile_repository.dart';
import 'package:vfuel/models/auth/user.dart';
import 'package:vfuel/models/districts.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_appbar.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

import 'change_password.dart';
import 'home/HomeScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditClicked = true;
  late ProfileCubit _profileCubit;
  late Profile _customerProfile;
  UserSession? _usersesion;
  String? _partnerCode;
  District? selectedDistrict;
  List<District> districts = [];
  final FocusNode _nodeNumberType = FocusNode();
  GlobalKey<FormState>? _key = new GlobalKey();
  TextEditingController _name_controller = TextEditingController();
  TextEditingController _address_controller = TextEditingController();
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _contact_controller = TextEditingController();
  TextEditingController _businessPhone_controller = TextEditingController();
  TextEditingController _pincose_controller = TextEditingController();
  TextEditingController _district_controller = TextEditingController();
  TextEditingController _gstin_controller = TextEditingController();
  TextEditingController _businessName_controller = TextEditingController();

  void handleEditIconClicked() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _profileCubit = ProfileCubit(UserProfileRepository());
    _profileCubit.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: vfuelColors.SecondaryBGColor,
        appBar: vfuelAppBar("Profile"),
        body: BlocProvider(
            create: (context) => _profileCubit,
            child: BlocListener<ProfileCubit, ProfileState>(
              bloc: _profileCubit,
              listener: (context, state) {
                if (state is ProfileLoading ||
                    state is UpdateUserLoading ||
                    state is DistrictsLoading) {
                  Utils.showLoadingIndicator(context);
                } else if (state is DistrictsFetchedSuccessfully) {
                  Utils.dismissLoadingIndicator(context);
                  districts = state.districts;
                  selectedDistrict = districts.first;
                } else if (state is ProfileFetchedSuccessfull) {
                  Utils.dismissLoadingIndicator(context);
                  _customerProfile = state.profile;
                } else if (state is DistrictsFetchFailed) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                } else if (state is UpdateUserSuccessful) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                    context,
                    AlertType.success,
                    "Success",
                    "Profile Updated Successfully",
                    okButtonText: "OK",
                    okButtonCallBack: () {
                      Navigator.pop(context, 'Ok');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen()));
                    },
                  );
                } else if (state is ProfileLoadingFailed) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                } else if (state is UpdateUserError) {
                  Utils.dismissLoadingIndicator(context);
                  Utils.showDialouge(
                      context, AlertType.error, 'Oops!', state.error);
                }
              },
              child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                if (state is ProfileIntial) {
                  _profileCubit.getDistricts();
//exception
                  return ProfileScreen();
                } else {
                  return Form(
                    child: profileForm(),
                    key: _key,
                  );
                }
              }),
            )));
  }

  Widget profileForm() {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: 150,
          width: double.infinity,
          color: Colors.white,
        ),
        SingleChildScrollView(
            child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(15),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.transparent),
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                              child: Column(
                            children: [
                              // CircleAvatar(
                              //   radius: 30.0,
                              //   backgroundColor: Colors.transparent,
                              //   backgroundImage: ExactAssetImage(
                              //       'assets/images/profile_pic.png'),
                              // ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: deviceWidth * 0.18)),
                                    Expanded(
                                      child: vfuelText(
                                          text: _customerProfile.name,
                                          fontColor:
                                              vfuelColors.PrimaryTextColor,
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          alignment: TextAlign.center),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: deviceWidth * 0.15)),
                                    Visibility(
                                        visible: isEditClicked == true
                                            ? true
                                            : false,
                                        child: IconButton(
                                            onPressed: () async {
                                              setState(() {
                                                isEditClicked = !isEditClicked;
                                                getvaluesForTextField();
                                              });
                                            },
                                            icon: Container(
                                              height: 15,
                                              child: Image.asset(
                                                  'assets/images/profileedit.png'),
                                            ))),
                                    Visibility(
                                        visible: isEditClicked == false
                                            ? true
                                            : false,
                                        child: IconButton(
                                            onPressed: () {
                                              updateUser(false);
                                            },
                                            icon: Icon(
                                              Icons.save,
                                              color: Colors.red,
                                              size: 20,
                                            )))
                                  ]),
                              Visibility(
                                visible: isEditClicked == true ? true : false,
                                child: Column(
                                  children: [
                                    Divider(
                                        color: vfuelColors.GreyImageBGColor),
                                    verificationPath(),
                                    Padding(padding: EdgeInsets.only(top: 10)),
                                    Divider(color: vfuelColors.GreyImageBGColor)
                                  ],
                                ),
                              )
                            ],
                          )),
                          SizedBox(height: 20),
                          vfuelText(text: "Contact Person Name"),
                          SizedBox(height: 5),
                          isEditClicked
                              ? vfuelText(
                                  text: _customerProfile.name,
                                  fontColor: vfuelColors.GreyTextColor,
                                  alignment: TextAlign.start)
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _name_controller,
                                    validator:
                                        vfuelValidators.noneEmptyValidator,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String? val) {
                                      setState(() {
                                        _name_controller.text = val!;
                                      });
                                    },
                                  )),
                          SizedBox(height: 15),
                          vfuelText(text: "Phone Number"),
                          SizedBox(height: 5),
                          isEditClicked
                              ? Container(
                                  height: 30,
                                  child: Row(children: [
                                    vfuelText(
                                        text: _customerProfile.phone != null
                                            ? _customerProfile.phone
                                            : "NA",
                                        fontColor: vfuelColors.GreyTextColor,
                                        alignment: TextAlign.start),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Profile().phoneVerified == null
                                            ? Container(
                                                height: 15,
                                                child: Image.asset(
                                                    'assets/images/unverify.png'),
                                              )
                                            : Image.asset(
                                                'assets/images/verify.png'))
                                  ]))
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _businessPhone_controller,
                                    validator:
                                        vfuelValidators.mobileNumberValidator,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    onSaved: (String? val) {
                                      setState(() {
                                        _businessPhone_controller.text = val!;
                                      });
                                    },
                                    focusNode: _nodeNumberType,
                                  )),
                          SizedBox(height: 15),
                          vfuelText(text: "Email"),
                          SizedBox(height: 5),
                          isEditClicked
                              ? Container(
                                  height: 30,
                                  child: Row(children: [
                                    vfuelText(
                                        text: _customerProfile.email,
                                        fontColor: vfuelColors.GreyTextColor,
                                        alignment: TextAlign.start),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Profile().phoneVerified == null
                                            ? Container(
                                                height: 15,
                                                child: Image.asset(
                                                    'assets/images/unverify.png'),
                                              )
                                            : Image.asset(
                                                'assets/images/verify.png'))
                                  ]))
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _email_controller,
                                    validator: vfuelValidators.emailValidator,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    onSaved: (String? val) {
                                      setState(() {
                                        _email_controller.text = val!;
                                      });
                                    },
                                  )),
                          SizedBox(height: 15),
                          vfuelText(
                            text: "Business Information",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          SizedBox(height: 15),
                          vfuelText(text: "GSTIN"),
                          SizedBox(height: 5),
                          isEditClicked
                              ? vfuelText(
                                  text: _customerProfile.gstin,
                                  fontColor: vfuelColors.GreyTextColor,
                                  alignment: TextAlign.start)
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _gstin_controller,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String? val) {
                                      setState(() {
                                        _gstin_controller.text = val!;
                                      });
                                    },
                                  )),
                          SizedBox(height: 15),
                          vfuelText(text: "Business entity name"),
                          SizedBox(height: 5),
                          isEditClicked
                              ? vfuelText(
                                  text: _customerProfile.businessName,
                                  fontColor: vfuelColors.GreyTextColor,
                                  alignment: TextAlign.start)
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _businessName_controller,
                                    validator:
                                        vfuelValidators.noneEmptyValidator,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String? val) {
                                      setState(() {
                                        _businessName_controller.text = val!;
                                      });
                                    },
                                  )),
                          SizedBox(height: 15),
                          vfuelText(
                            text: "Address",
                            alignment: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          isEditClicked
                              ? vfuelText(
                                  text: _customerProfile.address,
                                  alignment: TextAlign.start,
                                  fontColor: vfuelColors.GreyTextColor,
                                )
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _address_controller,
                                    validator:
                                        vfuelValidators.noneEmptyValidator,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String? val) {
                                      setState(() {
                                        _address_controller.text = val!;
                                      });
                                    },
                                  )),
                          SizedBox(height: 15),
                          vfuelText(
                            text: "District",
                            alignment: TextAlign.start,
                          ),
                          SizedBox(height: 5),
                          isEditClicked
                              ? vfuelText(
                                  text: _customerProfile.district,
                                  fontColor: vfuelColors.GreyTextColor,
                                  alignment: TextAlign.start)
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: DropdownButtonFormField<District>(
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none),
                                    icon: const Icon(Icons.arrow_drop_down),
                                    iconSize: 24,
                                    elevation: 16,
                                    value: selectedDistrict,
                                    style: vfuelStyles.formTextStyle(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedDistrict = value;
                                      });
                                    },
                                    items: districts
                                        .map<DropdownMenuItem<District>>(
                                            (District value) {
                                      return DropdownMenuItem<District>(
                                        value: value,
                                        child: Text(value.name!),
                                      );
                                    }).toList(),
                                  )),
                          SizedBox(height: 15),
                          vfuelText(text: "Pin Code"),
                          SizedBox(height: 5),
                          isEditClicked
                              ? vfuelText(
                                  text: _customerProfile.pincode.toString(),
                                  alignment: TextAlign.start,
                                  fontColor: vfuelColors.GreyTextColor)
                              : Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffE6E6E6),
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(10.0),
                                  ),
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                                  child: TextFormField(
                                    controller: _pincose_controller,
                                    validator: vfuelValidators.pincodeValidator,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    style: vfuelStyles.formTextStyle(),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    onSaved: (String? val) {
                                      setState(() {});
                                    },
                                  )),
                          SizedBox(height: 15),
                          TextButton(
                              onPressed: () {
                                print(Profile().phoneVerified);
                                print('****');
                                print(Profile().emailVerified);
                                showChangePasswordDialouge();
                              },
                              child: Visibility(
                                visible: isEditClicked == true ? true : false,
                                child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.orange),
                                        borderRadius: BorderRadius.circular(5)),
                                    width: double.infinity,
                                    height: 50,
                                    child: Center(
                                        child: Text(
                                      "Change Password",
                                      style: TextStyle(
                                          color: vfuelColors.GreyTextColor),
                                      textAlign: TextAlign.center,
                                    ))),
                              ))
                        ],
                      ),
                    ))))
      ],
    );
  }

  showChangePasswordDialouge() {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return ChangePassowordView(
            alertContext: context,
          );
        });
  }

  verificationPath() {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            vfuelText(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              text: 'Registered',
            ),
            SizedBox(
              width: deviceWidth * 0.01,
            ),
            Container(
              height: 15,
              child: Image.asset('assets/images/verify.png'),
            ),
            SizedBox(
              width: deviceWidth * 0.01,
            ),
            Container(
              height: 15,
              child: Image.asset('assets/images/rightarrow.png'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            vfuelText(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              text: 'Verified',
            ),
            SizedBox(
              width: deviceWidth * 0.01,
            ),
            Profile().phoneVerified == null
                ? Container(
                    height: 15,
                    child: Image.asset('assets/images/unverify.png'))
                : Container(
                    height: 15, child: Image.asset('assets/images/verify.png')),
            SizedBox(
              width: deviceWidth * 0.01,
            ),
            Container(
              height: 15,
              child: Image.asset('assets/images/rightarrow.png'),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            vfuelText(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              text: 'Admin \n Approved',
            ),
            SizedBox(
              width: deviceWidth * 0.01,
            ),
            Image.asset('assets/images/verifieddisabled.png')
          ],
        ),
      ],
    );
  }

  updateUser(bool isPartnerCodeEmpty) async {
    final isValid = _key!.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key!.currentState!.save();
    UserSession _usersesion =
        await (UserManager.instance.getUserSession() as FutureOr<UserSession>);

    User user = User(
      id: _usersesion.userId,
      name: _name_controller.text,
      address: _address_controller.text,
      email: _email_controller.text,
      phone: _businessPhone_controller.text,
      gstin: _gstin_controller.text,
      businessName: _businessName_controller.text,
      pincode: int.parse(_pincose_controller.text),
      districtId: selectedDistrict!.districtId,
    );

    _profileCubit.updateUser(user);
  }

  getvaluesForTextField() {
    _name_controller.text = _customerProfile.name!;
    _address_controller.text = _customerProfile.address!;
    _email_controller.text = _customerProfile.email!;
    _businessPhone_controller.text = _customerProfile.phone!;
    _businessName_controller.text = _customerProfile.businessName!;
    _district_controller.text = _customerProfile.district!;
    _gstin_controller.text = _customerProfile.gstin!;
    _pincose_controller.text = (_customerProfile.pincode).toString();
  }
}
