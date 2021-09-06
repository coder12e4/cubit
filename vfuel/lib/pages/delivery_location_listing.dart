import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/address/delivery_address_cubit.dart';
import 'package:vfuel/cubit/repository/delivery_address_repository.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_appbar.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

import 'delivery_location_selection.dart';

typedef AddressSelectionCallBack = void Function(DeliveryAddress);

class DeliveryLocationList extends StatefulWidget {
  final bool? enableSelection;

  const DeliveryLocationList({Key? key, this.enableSelection})
      : super(key: key);
  @override
  _DeliveryLocationListState createState() => _DeliveryLocationListState();
}

class _DeliveryLocationListState extends State<DeliveryLocationList> {
  bool isEditClicked = true;
  late DeliveryAddressCubit _deliveryAddressCubit;
  Profile _customerProfile = UserManager.instance.getCurrentUserProfile();
  List<DeliveryAddress> deliveryAddressList = <DeliveryAddress>[];
  @override
  void initState() {
    super.initState();
    _deliveryAddressCubit =
        DeliveryAddressCubit(UserDeliveryLocationRepository());
    _deliveryAddressCubit.fetchAllAddrresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: vfuelAppBar(
          "My Delivery Locations",
          bgColor: Colors.white,
        ),
        body: BlocProvider(
            create: (context) => _deliveryAddressCubit,
            child: BlocListener<DeliveryAddressCubit, DeliveryAddressState>(
              bloc: _deliveryAddressCubit,
              listener: (context, state) {
                if (state is DeliveryAddressLoading) {
                  // Utils.showLoadingIndicator(context);
                } else if (state is DeliveryAddressFetchSuccessful) {
                  // Utils.dismissLoadingIndicator(context);
                  setState(() {
                    deliveryAddressList = state.deliveryAddressList;
                  });
                } else if (state is DeliveryAddressFetchFailed) {
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                } else if (state is DeliveryAddressDeletionSuccess) {
                  Utils.dismissLoadingIndicator(context);
                } else if (state is DeliveryAddressDeletionFailed) {
                  Utils.showDialouge(
                      context, AlertType.error, "Oops!", state.error);
                }
              },
              child: BlocBuilder<DeliveryAddressCubit, DeliveryAddressState>(
                  builder: (context, state) {
                if (state is DeliveryAddressEmpty) {
                  return emptyState();
                } else {
                  if (!deliveryAddressList.isEmpty) {
                    return Container(
                        child: Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.75,
                            child: ListView.builder(
                                itemCount: deliveryAddressList.length,
                                itemBuilder: (BuildContext ctxt, int index) {
                                  return addressCard(
                                      deliveryAddressList[index]);
                                })),
                        Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                                color: Colors.transparent,
                                height: 60,
                                child: vfuelButton(
                                    title: "ADD OTHER ADDRESS",
                                    onPressed: () {
                                      vfuelRouter.navigateTo(context,
                                          Screen.DeliveryLocationsSelector);
                                    },
                                    cornerRadius: 10,
                                    gradient: vfuelColors.buttonOrangeGradient,
                                    textColor: Colors.white)))
                      ],
                    ));
                  } else {
                    return Container();
                  }
                }
              }),
            )));
  }

  Widget addressCard(DeliveryAddress address) {
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Container(
          height: 118,
          // margin: EdgeInsets.only(left: 16, right: 16, top: 2.5, bottom: 2.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(),
                  child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                if (widget.enableSelection!) {
                                  Navigator.pop(context, address);
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .58,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        vfuelWrapperText(
                                          text: address.name,
                                          fontColor:
                                              vfuelColors.PrimaryTextColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          lines: 1,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    vfuelText(
                                      text: address.landMark,
                                      fontColor: vfuelColors.GreyTextColor,
                                    ),
                                    SizedBox(height: 5),
                                    Expanded(
                                      flex: 1,
                                      child: vfuelText(
                                        text: address.area,
                                        fontColor: vfuelColors.GreyTextColor,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    vfuelText(
                                      text: address.district,
                                      fontColor: vfuelColors.GreyTextColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]))),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 5,
                  height: 118,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    color: Color(0xffF2642C),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                  width: 103,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DeliveryLocationSelector(
                                        isEdit: true,
                                        address: address,
                                      )));
                        },
                        child: Container(
                            height: 30,
                            width: 50,
                            padding: EdgeInsets.only(bottom: 10, top: 5),
                            child: Icon(Icons.edit_outlined,
                                color: vfuelColors.buttonGreyBgColor)),
                      ),
                      Container(
                        width: 2,
                        color: vfuelColors.buttonGreyBgColor,
                      ),
                      InkWell(
                        onTap: () {
                          _deliveryAddressCubit
                              .deleteDeliveryAddress(address.id);
                        },
                        child: Container(
                            height: 30,
                            width: 50,
                            padding: EdgeInsets.only(bottom: 10, top: 5),
                            child: Icon(Icons.delete_outline,
                                color: vfuelColors.buttonGreyBgColor)),
                      ),
                    ],
                  ),
                  height: 30,
                ),
              ),
            ],
          ),
        ));
  }

  Widget emptyState() {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vfuelText(
              text: "We don’t have your address",
              fontColor: vfuelColors.blackTextColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            vfuelText(
              text: "Add your address so that we can deliver easily!",
              fontColor: vfuelColors.mediumGreyTextColor,
              fontSize: 14,
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    height: 60,
                    child: vfuelButton(
                        title: "ADD YOUR ADDRESS",
                        onPressed: () {
                          vfuelRouter.navigateTo(
                              context, Screen.DeliveryLocationsSelector);
                        },
                        cornerRadius: 10,
                        gradient: vfuelColors.buttonOrangeGradient,
                        textColor: Colors.white)))
          ],
        ),
      ),
    ));
  }
}
