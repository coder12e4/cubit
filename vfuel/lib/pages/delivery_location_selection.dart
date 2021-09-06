import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/managers/location_manager.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/Utils/validators.dart';
import 'package:vfuel/cubit/address/delivery_address_cubit.dart';
import 'package:vfuel/cubit/repository/delivery_address_repository.dart';
import 'package:vfuel/models/delivery_location.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_appbar.dart';
import 'package:vfuel/widgets/vfuel_button.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

import 'delivery_location_listing.dart';

// ignore: must_be_immutable
class DeliveryLocationSelector extends StatefulWidget {
  bool? isEdit = false;
  DeliveryAddress? address;
  DeliveryLocationSelector({this.isEdit, this.address});
  @override
  _DeliveryLocationSelectorState createState() =>
      _DeliveryLocationSelectorState();
}

class _DeliveryLocationSelectorState extends State<DeliveryLocationSelector> {
  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _blokNoController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  List<AutocompletePrediction> predictions = [];
  DetailsResult? detailsResult;
  List<Widget> addressList = [];
  Set _markers = {};
  LatLng? markerLocation = null;
  bool isEditClicked = true;

  LatLng? _center;

  String? address;
  LocationDetails? locationDetails;
  late DeliveryAddressCubit _deliveryAddressCubit;
  bool makeMarkerDraggable = false;
  Completer<GoogleMapController> _mapController = Completer();
  void _onMapCreated(GoogleMapController controller) {
    _mapController.complete(controller);
  }

  GlobalKey<FormState> _key = new GlobalKey();

  String placeName = "";
  String? fullAddress = "";
  // ignore: unused_field
  int _currentSelection = 0;
  // ignore: unused_field
  String? _landmark = "";
  // ignore: unused_field
  String _industry = "";
  String? _district = "";
  String? _nickeName = "";
  Marker? locationMarker;
  @override
  void initState() {
    super.initState();
    _deliveryAddressCubit =
        DeliveryAddressCubit(UserDeliveryLocationRepository());
    widget.isEdit! ? editInit() : getCurrentLocation();
  }

  void editInit() {
    getCurrentLocation();
    _blokNoController.text = widget.address!.city!;
    _nickNameController.text = widget.address!.name!;
    _districtController.text = widget.address!.district!;
    _landmarkController.text = widget.address!.landMark!;
    LatLng pos = LatLng(
        double.parse(widget.address!.lat!), double.parse(widget.address!.lng!));

    print(pos);
    _changeMarker(pos);
  }

  void getCurrentLocation({LatLng? pos}) async {
    _center = await LocationManager.instance.getCurrentLocation();
    if (pos != null) {
      setState(() {
        _center = pos;
      });
    }
    markerLocation = _center;
    setState(() {
      getCurrentAddress();
      locationMarker = Marker(
          markerId: MarkerId("myLocation"),
          draggable: true,
          position: pos == null ? _center! : pos,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onDragEnd: (_currentlatLng) {
            markerLocation = _currentlatLng;
            getCurrentAddress();
          });
    });
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _center!, zoom: 15),
      ),
    );
  }

  void _changeMarker(LatLng pos) {
    if (makeMarkerDraggable) {
      print(pos);
      getCurrentLocation(pos: pos);
    }
  }

  getCurrentAddress() async {
    locationDetails =
        await LocationManager.instance.getAddressDetails(markerLocation!);
    setState(() {
      placeName = locationDetails!.address!;
    });
  }

  editAddrrss() async {
    final isValid = _key.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key.currentState!.save();
    if (locationDetails != null) {
      Profile profile =
          await (UserManager.instance.getUserProfile() as FutureOr<Profile>);
      DeliveryAddress address = DeliveryAddress(
          id: widget.address!.id,
          address: locationDetails!.address,
          area: _blokNoController.text,
          city: locationDetails!.district,
          lat: locationDetails!.lat.toString(),
          lng: locationDetails!.long.toString(),
          name: _nickNameController.text,
          district: _districtController.text,
          state: locationDetails!.state,
          landMark: _landmarkController.text,
          phone: profile.phone);
      _deliveryAddressCubit.editDeliveryAddress(address);
      addressList.add(Card(
        child: Text(address.name!),
      ));
      setState(() {
        fullAddress = address.name;
      });
    }
  }

  addAddrrss() async {
    final isValid = _key.currentState!.validate();
    if (!isValid) {
      return;
    }
    _key.currentState!.save();
    if (locationDetails != null) {
      Profile profile =
          await (UserManager.instance.getUserProfile() as FutureOr<Profile>);
      DeliveryAddress address = DeliveryAddress(
          address: locationDetails!.address,
          area: locationDetails!.street,
          city: _blokNoController.text,
          lat: locationDetails!.lat.toString(),
          lng: locationDetails!.long.toString(),
          name: _nickeName,
          district: _district,
          state: locationDetails!.state,
          landMark: _landmarkController.text,
          phone: profile.phone);
      _deliveryAddressCubit.addDeliveryAddress(address);
      addressList.add(Card(
        child: Text(address.name!),
      ));
      setState(() {
        fullAddress = address.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: vfuelAppBar(
        "My Delivery Locations",
        bgColor: Colors.transparent,
      ),
      body: BlocProvider(
        create: (context) => _deliveryAddressCubit,
        child: BlocListener<DeliveryAddressCubit, DeliveryAddressState>(
          bloc: _deliveryAddressCubit,
          listener: (context, state) {
            if (state is DeliveryAddressLoading) {
              Utils.showLoadingIndicator(context);
            } else if (state is DeliveryAddressAddedSuccesfully) {
              Utils.dismissLoadingIndicator(context);
              Utils.showDialouge(context, AlertType.success, "Success",
                  "Address added successfully", okButtonCallBack: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DeliveryLocationList()));
              });
            } else if (state is DeliveryAddressEditedSuccesfully) {
              Utils.dismissLoadingIndicator(context);
              Utils.showDialouge(context, AlertType.success, "Success",
                  "Address edited successfully", okButtonCallBack: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => DeliveryLocationList()));
              });
            } else if (state is DeliveryAddressCreationFailed) {
              Utils.dismissLoadingIndicator(context);
              Utils.showDialouge(
                  context, AlertType.error, "Oops!", state.error);
            } else if (state is GooglePlaceFetchSuccessful) {
              print(state.predictions.length);
              setState(() {
                predictions = state.predictions;
              });
              if (predictions.isEmpty) {
                print('emty');
              }
            } else if (state is PlaceLateLongFetchSuccessful) {
              Utils.dismissLoadingIndicator(context);
              _changeMarker(state.latLng);
              setState(() {
                predictions = [];
                _searchController.clear();
                makeMarkerDraggable = false;
              });
            } else if (state is PlaceLateLongFetchError) {
              Utils.dismissLoadingIndicator(context);
            }
          },
          child: BlocBuilder<DeliveryAddressCubit, DeliveryAddressState>(
              builder: (context, state) {
            return Form(
              key: _key,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Visibility(
                        visible: makeMarkerDraggable,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 30,
                          width: double.infinity,
                          child: TextField(
                            textAlign: TextAlign.start,
                            onChanged: (value) {
                              if (!_searchController.text.isEmpty) {
                                _deliveryAddressCubit.placeList(value);
                              } else {
                                setState(() {
                                  predictions = [];
                                });
                              }
                            },
                            controller: _searchController,
                            decoration: InputDecoration(
                                isCollapsed: true,
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  color: Color.fromRGBO(216, 216, 216, 1),
                                  fontFamily: "Poppins Regular",
                                  fontSize: 14.0,
                                )),
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 250,
                            child: (_center != null)
                                ? GoogleMap(
                                    onMapCreated: _onMapCreated,
                                    initialCameraPosition: CameraPosition(
                                      target: _center!,
                                      zoom: 15.0,
                                    ),
                                    markers: Set.from([locationMarker]),
                                    onTap: _changeMarker,
                                  )
                                : Container(),
                          ),
                          Visibility(
                            visible: (makeMarkerDraggable &&
                                !predictions.isEmpty &&
                                !_searchController.text.isEmpty),
                            child: Container(
                              height: 250,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                backgroundBlendMode: BlendMode.darken,
                              ),
                              child: ListView.builder(
                                  itemCount: predictions.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: vfuelWrapperText(
                                        text: predictions[index].description,
                                        fontColor: Colors.white,
                                        alignment: TextAlign.start,
                                      ),
                                      onTap: () {
                                        _deliveryAddressCubit.placeLatLong(
                                            predictions[index].placeId!);
                                      },
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Padding(
                            padding: EdgeInsets.only(
                                top: 15, bottom: 15, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          height: 20,
                                          width: 18,
                                          child: Image.asset(
                                              "assets/images/my_locations.png")),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Container(
                                          // width: MediaQuery.of(context)
                                          //         .size
                                          //         .width *
                                          //     0.5,
                                          child: vfuelText(
                                            text: placeName,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            fontColor: Colors.black,
                                            alignment: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          width: 120,
                                          height: 50,
                                          child: TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  makeMarkerDraggable =
                                                      !makeMarkerDraggable;
                                                });
                                              },
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      color: vfuelColors
                                                          .buttonLightGreyBgColor,
                                                      border: Border.all(
                                                          color: vfuelColors
                                                              .buttonLightGreyBorderColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  width: double.infinity,
                                                  child: Center(
                                                      child: Text(
                                                    "Change",
                                                    style: TextStyle(
                                                        color: vfuelColors
                                                            .orangeTextColor),
                                                    textAlign: TextAlign.center,
                                                  )))))
                                    ]),
                                SizedBox(
                                  height: 10,
                                ),
                                vfuelText(
                                  text: fullAddress,
                                  fontSize: 13,
                                  fontColor: Colors.black,
                                  alignment: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  onSaved: (String? val) {
                                    _nickeName = val;
                                  },
                                  controller: _nickNameController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: vfuelValidators.noneEmptyValidator,
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'Address Nick Name',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(216, 216, 216, 1),
                                        fontFamily: "Poppins Regular",
                                        fontSize: 14.0,
                                      )),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                TextFormField(
                                  textAlign: TextAlign.start,
                                  onSaved: (String? val) {
                                    _landmark = val;
                                  },
                                  controller: _blokNoController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: vfuelValidators.noneEmptyValidator,
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'Industry/ Block No',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(216, 216, 216, 1),
                                        fontFamily: "Poppins Regular",
                                        fontSize: 14.0,
                                      )),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                TextFormField(
                                  onSaved: (String? val) {
                                    // _landmark = val;
                                  },
                                  controller: _landmarkController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: vfuelValidators.noneEmptyValidator,
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'Landmark',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(216, 216, 216, 1),
                                        fontFamily: "Poppins Regular",
                                        fontSize: 14.0,
                                      )),
                                ),
                                Padding(padding: EdgeInsets.only(top: 10)),
                                TextFormField(
                                  onSaved: (String? val) {
                                    _district = val;
                                  },
                                  controller: _districtController,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: vfuelValidators.noneEmptyValidator,
                                  decoration: InputDecoration(
                                      isCollapsed: true,
                                      hintText: 'District',
                                      hintStyle: TextStyle(
                                        color: Color.fromRGBO(216, 216, 216, 1),
                                        fontFamily: "Poppins Regular",
                                        fontSize: 14.0,
                                      )),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 20),
                                    child: vfuelButton(
                                        cornerRadius: 5,
                                        gradient:
                                            vfuelColors.buttonOrangeGradient,
                                        title: "SAVE AND PROCEED",
                                        textColor: Colors.white,
                                        onPressed: () {
                                          if (!widget.isEdit!) {
                                            addAddrrss();
                                          } else {
                                            editAddrrss();
                                          }
                                        })),
                              ],
                            )),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
