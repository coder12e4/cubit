import 'package:cheersclub/Utils/utils.dart';
import 'package:cheersclub/cubit/placeorder/place_order_cubit.dart';
import 'package:cheersclub/cubit/repository/PlaceOrderRepo.dart';
import 'package:cheersclub/models/Restourent/RestourentViewModel.dart';
import 'package:cheersclub/models/Restourent/products.dart';
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

import 'kartpage.dart';

class PlaceOrder extends StatefulWidget {
  final int? restouretId;
  final int? main;
  final int? sub;

  const PlaceOrder({Key? key, this.restouretId, this.main, this.sub})
      : super(key: key);

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool value = false;
  GlobalKey<ScaffoldState> _key = GlobalKey();
  String? _chosenValue;
  String? _chosenValue2 = "no data";
  String? _chosenValue3 = "no data";
  late PlaceOrderCubit placeOrderCubit;
  Restaurant? restaurant;
  List<MainCategories>? main_catogories = [];
  List<SubCategories>? subCategories_drks = [];
  List<SubCategories>? subCategories_snaks = [];
  List<SubCategories>? subCategories_deserts = [];
  List<Products>? products_list = [];

  List<int>? _selectedItems;
  var Count_Controller = TextEditingController();
  SubCategories? selecteddrink;
  SubCategories? selecteddrink2;
  SubCategories? selecteddrink3;
  String? _radioValue; //Initial definition of radio button value
  String? choice;
  List<TextEditingController>? _controllers = [];
  bool value_bussiness = false;
  String? type = "";
  int? cart_count;

  void radioButtonChanges(String? value) {
    setState(() {
      _radioValue = value!;
      switch (value) {
        case 'Glass':
          choice = value;
          break;
        case 'Blottle':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }

  String? restId;
  @override
  void initState() {
    _selectedItems = <int>[];
    placeOrderCubit = PlaceOrderCubit(GetOneRestourents());
    restId = widget.restouretId!.toString();

    // TODO: implement initState
    placeOrderCubit.SingleRestorentLoadingGet(widget.restouretId!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: drowerAfterlogin(),
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
          create: (context) => placeOrderCubit,
          child: BlocListener<PlaceOrderCubit, PlaceOrderState>(
            bloc: placeOrderCubit,
            listener: (context, state) {
              if (state is PlaceOrderInitial) {}
              if (state is PlaceOrderLoading) {
                /*
                Navigator.push(
                  context,
                  PageTransition(
                      duration: Duration(milliseconds: 1000),
                      type: PageTransitionType.rightToLeft,
                      child: Home(),
                      inheritTheme: true,
                      ctx: context),
                );
              */
              } else if (state is PlaceOrderSuccess) {
                //selectedDistrict = subCategories!.first;
                cart_count = state.cart_count;
                restaurant = state.restaurant;
                main_catogories = state.mainCategories;
                subCategories_drks = state.subCategories_drks;
                print("*********");
                print(subCategories_drks!.length);
                print("*********");
                // selecteddrink = subCategories_drks!.first;
                subCategories_snaks = state.subCategories_snaks;
                subCategories_deserts = state.subCategories_deserts;
                //   Utils.showDialouge(context, AlertType.error, "Oops!", state.msg);
              } else if (state is PlaceOrderFail) {
                //   Utils.showDialouge(context, AlertType.error, "Oops!", state.msg);
              } else if (state is AddToKartLoading) {
                //   Utils.showDialouge(context, AlertType.error, "Oops!", state.msg);
              } else if (state is AddToKartSuccess) {
                Utils.showDialouge(context, AlertType.error, "Oops!",
                    "Added item successfully");
              } else if (state is AddToKartFail) {
                Utils.showDialouge(
                    context, AlertType.error, "Oops!", state.error);
              } else if (state is productLoading) {
                //  Utils.showDialouge(
                //      context, AlertType.error, "Oops!", state.error);
              } else if (state is productSuccess) {
                products_list = state.products_list;
              } else if (state is productFail) {
                Utils.showDialouge(
                    context, AlertType.error, "No Products Yet", state.error);
              }
            },
            child: BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                builder: (context, state) {
              if (state is PlaceOrderInitial) {
                return Container();
              }
              if (state is PlaceOrderLoading) {
                return Container();
              } else if (state is PlaceOrderSuccess) {
                return kartForm();
              } else if (state is PlaceOrderFail) {
                return kartForm();
              } else if (state is AddToKartLoading) {
                return kartForm();
              } else if (state is AddToKartSuccess) {
                return kartForm();
              } else if (state is AddToKartFail) {
                return kartForm();
              } else if (state is productLoading) {
                return kartForm();
              } else if (state is productSuccess) {
                return kartForm();
              } else if (state is productFail) {
                return kartForm();
              } else {
                return kartForm();
              }
            }),
          )),
    );
  }

  Widget myAppBarIcon(int k) {
    return Container(
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            color: Colors.white,
            size: 26,
          ),
          Container(
            width: 27,
            height: 30,
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 0),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: HexColor("FFC853"),
                  border: Border.all(color: Colors.white, width: 1)),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Text(
                    "" + "${k}",
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget kartForm() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: HexColor("1A1B1D"),
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
                        Container(
                            margin: EdgeInsets.only(right: 10, top: 40),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: Restourentcart(
                                          restorent_id: widget.restouretId,
                                        ),
                                        inheritTheme: true,
                                        ctx: context),
                                  );
                                },
                                child: myAppBarIcon(cart_count!))),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _key.currentState!.openEndDrawer();
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
              margin: EdgeInsets.only(left: 30, top: 20, bottom: 20),
              child: CheersClubText(
                text: restaurant!.name,
                fontColor: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, top: 0, bottom: 20),
              child: CheersClubText(
                alignment: TextAlign.left,
                text: "${restaurant?.address}" +
                    "${restaurant?.city}" +
                    "\n" +
                    "${restaurant?.country}",
                fontColor: Colors.white,
                fontSize: 18,
              ),
            ),
            Container(
              padding: EdgeInsets.all(4),
              color: HexColor("5D5D5E"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 46,
                      width: 110,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.only(left: 4),
                      color: HexColor("FEC753"),
                      child: DropdownButtonFormField<SubCategories>(
                        decoration:
                            InputDecoration(enabledBorder: InputBorder.none),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        hint: Text("Drinks"),
                        value: selecteddrink,
                        // style: VFuelStyles.formTextStyle(),
                        onChanged: (value) {
                          selecteddrink = value;
                          placeOrderCubit.loadProducts(
                              restId, "${selecteddrink!.id}");
                        },
                        items: subCategories_drks
                            ?.map<DropdownMenuItem<SubCategories>>(
                                (SubCategories value) {
                          return DropdownMenuItem<SubCategories>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 46,
                      width: 110,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.only(left: 4),
                      color: HexColor("FEC753"),
                      child: DropdownButtonFormField<SubCategories>(
                        decoration:
                            InputDecoration(enabledBorder: InputBorder.none),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        hint: Text("DESERTS"),
                        value: selecteddrink2,

                        // style: VFuelStyles.formTextStyle(),
                        onChanged: (value) {
                          selecteddrink2 = value;

                          placeOrderCubit.loadProducts(
                              restId, "${selecteddrink2!.id}");
                        },
                        items: subCategories_snaks
                            ?.map<DropdownMenuItem<SubCategories>>(
                                (SubCategories value) {
                          return DropdownMenuItem<SubCategories>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                      height: 46,
                      width: 110,
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.only(left: 4),
                      color: HexColor("FEC753"),
                      child: DropdownButtonFormField<SubCategories>(
                        decoration:
                            InputDecoration(enabledBorder: InputBorder.none),
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        hint: Text("BITES"),
                        value: selecteddrink3,
                        // style: VFuelStyles.formTextStyle(),
                        onChanged: (value) {
                          selecteddrink3 = value;
                          placeOrderCubit.loadProducts(
                              restId, "${selecteddrink3!.id}");
                        },
                        items: subCategories_deserts
                            ?.map<DropdownMenuItem<SubCategories>>(
                                (SubCategories value) {
                          return DropdownMenuItem<SubCategories>(
                            value: value,
                            child: Text(value.name!),
                          );
                        }).toList(),
                      )),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheersClubText(
                        text: "${selecteddrink?.name}",
                        fontColor: HexColor("FFC853"),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: ListView.builder(
                      itemCount: products_list?.length,
                      itemBuilder: (context, index) {
                        _controllers?.add(new TextEditingController());
                        print(products_list?.length);

                        if (products_list?.length != 0) {
                          return GestureDetector(
                            onTap: () {
                              /*
                          Navigator.push(
                            context,
                            PageTransition(
                                duration: Duration(milliseconds: 1000),
                                type: PageTransitionType.rightToLeft,
                                child: kartpage(),
                                inheritTheme: true,
                                ctx: context),
                          );
*/

                              if (!_selectedItems!.contains(index)) {
                                setState(() {
                                  _selectedItems!.clear();
                                  _selectedItems!.add(index);
                                });
                              } else {
                                setState(() {
                                  _selectedItems!
                                      .removeWhere((val) => val == index);
                                });
                              }

                            },
                            child: Container(
                              height:
                                  _selectedItems!.contains(index) ? 250 : 150,
                              margin: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 60,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 80,
                                          child: CheersClubText(
                                            text: products_list?[index].name,
                                            fontColor: HexColor("FFC853"),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          width: 150,
                                          child: CheersClubText(
                                            text: products_list?[index]
                                                .description,
                                            alignment: TextAlign.center,
                                            fontColor: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),

                                        /*
                                        CheersClubText(
                                          text: products_list?[index]
                                              .price
                                              .toString(),
                                          fontColor: Colors.white,
                                          fontSize: 14,
                                        ),
                                      */
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    visible: _selectedItems!.contains(index)
                                        ? true
                                        : false,
                                    child: Container(
                                      height: 140,
                                      margin: EdgeInsets.only(
                                          left: 20, right: 30, top: 0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Checkbox(
                                                activeColor: HexColor("FEC753"),
                                                side: BorderSide(
                                                    color: Colors.amber),
                                                checkColor: Colors.white,
                                                value: this.value,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    type = "Glass";
                                                    this.value_bussiness =
                                                        false;
                                                    this.value = value!;
                                                  });
                                                },
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0),
                                                child: const CheersClubText(
                                                  text: "Glass",
                                                  fontColor: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),



                                              Checkbox(
                                                activeColor: HexColor("FEC753"),
                                                side: BorderSide(
                                                    color: Colors.amber),
                                                checkColor: Colors.white,
                                                value: this.value_bussiness,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    type = "Bottle";
                                                    this.value = false;
                                                    this.value_bussiness =
                                                        value!;
                                                  });
                                                },
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 0, top: 0),
                                                child: const CheersClubText(
                                                  text: "Bottle",
                                                  fontColor: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 50,
                                                width: 60,
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 10,
                                                    top: 0),
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.number,
                                                  textAlign: TextAlign.center,
                                                  maxLength: 4,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  controller:
                                                      _controllers?[index],
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: 'Count',
                                                    hintStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14),
                                                    filled: true,
                                                    fillColor:
                                                        HexColor("28292C"),
                                                    contentPadding:
                                                        const EdgeInsets.only(
                                                            left: 2.0,
                                                            bottom: 6.0,
                                                            top: 8.0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .amberAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  placeOrderCubit.AddToKaert(
                                                      products_list?[index]
                                                          .id
                                                          .toString(),
                                                      _controllers?[index].text,
                                                      type);
                                                },
                                                child: Container(
                                                  width: 80,
                                                  height: 34,
                                                  color: HexColor("FEC753"),
                                                  margin: EdgeInsets.only(
                                                      left: 10,
                                                      top: 0,
                                                      bottom: 20),
                                                  child: Center(
                                                    child: const CheersClubText(
                                                      text: "Add to Kart",
                                                      fontColor: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      })),
            )
          ],
        ),
      ),
    );
  }
}
