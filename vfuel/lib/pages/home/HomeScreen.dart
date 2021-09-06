import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/Utils/managers/location_manager.dart';
import 'package:vfuel/Utils/managers/user_manager.dart';
import 'package:vfuel/Utils/utils.dart';
import 'package:vfuel/cubit/home/home_cubit.dart';
import 'package:vfuel/cubit/repository/home_repository.dart';
import 'package:vfuel/models/delivery_location.dart';
import 'package:vfuel/models/home/configuration.dart';
import 'package:vfuel/models/profile.dart';
import 'package:vfuel/pages/delivery_location_listing.dart';
import 'package:vfuel/pages/order_summary/order_summary_screen.dart';
import 'package:vfuel/router/router.dart';
import 'package:vfuel/widgets/vfuel_alert.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

import 'sliding_menu.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  bool home = true;
  bool notes = false;
  bool notifications = false;
  bool dwr = false;
  bool conta = false;

  String? _name = "";
  String? __name2;

  final FocusNode _nodeNumberType = FocusNode();

  DateTime selectedDate = DateTime.now();
  DeliveryAddress? selectedAddress;
  late HomeCubit _homeCubit;
  static late Configuration configuration;
  String? _selectedLocation = "";
  int? _selectedTabIndex = 0;
  TextEditingController _fuelQuantityController =
      TextEditingController(text: '0');
  var size, height, width;

  // final AddressSelectionCallBack locationSelectionCallback = {

  // }

  void _addressSelected(DeliveryAddress address) {
    setState(() {
      _selectedLocation = address.name;
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit(HomeRepository());
    getCurrentAddress();
  }

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

  void getCurrentAddress() async {
    LocationDetails? locationDetails =
        await LocationManager.instance.getCurrentAddressDetails();
    setState(() {
      _selectedLocation = locationDetails!.street;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToDeliveryAdderessList(bool selection) async {
    if (selection) {
      selectedAddress = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeliveryLocationList(
              enableSelection: selection,
            ),
          ));
      setState(() {
        if (selectedAddress != null) {
          _selectedLocation = selectedAddress!.name;
        }
      });
    } else {
      vfuelRouter.navigateTo(context, Screen.DeliveryLocationsList);
    }
  }

  Widget homeDashboard() {
    String url = 'https://www.google.com';
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        key: _key,
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  gradient: vfuelColors.buttonOrangeGradient,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500]!,
                      offset: Offset(0.0, 1.5),
                      blurRadius: 1.5,
                    ),
                  ]),
              child: new Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
            onTap: () {
              if (selectedAddress != null &&
                  _fuelQuantityController.text != '0' &&
                  _fuelQuantityController.text != '') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrderSummary(
                    selectedLocation: _selectedLocation,
                    qty: double.parse(_fuelQuantityController.text),
                    selectedAddress: selectedAddress,
                    selectedDate: selectedDate,
                    todayPrice: configuration.products!.first.price != null
                        ? double.parse(
                            configuration.products!.first.price.toString())
                        : 0,
                    productid: configuration.products!.first.name,
                  );
                }));
              } else {
                Utils.showDialouge(context, AlertType.error, 'Error',
                    'Please select a delivery location and qunatity required',
                    okButtonCallBack: () {});
              }
            }),
        drawer: DrawerMenu(
          menuClickCallback: (index) {
            if (index == 7) {
              vfuelRouter.launchurl(url);
            } else if (index == 8) {
              UserManager.instance.logOutUser();
              vfuelRouter.navigateTo(context, Screen.Login);
            } else if (index == 2) {
              goToDeliveryAdderessList(false);
            } else if (index == 4) {
              vfuelRouter.navigateTo(context, Screen.ProfileScreen);
            } else if (index == 1) {
              vfuelRouter.navigateTo(context, Screen.Orders);
            } else if (index == 5) {
              vfuelRouter.launchurl(url);
            }
          },
          onHeaderClicled: () {
            vfuelRouter.navigateTo(context, Screen.ProfileScreen);
          },
        ),
        // bottomNavigationBar: bottomNavigationTabs(),

        bottomNavigationBar: FABBottomAppBar2(
          centerItemText: '   ',
          color: Colors.grey,
          selectedColor: Colors.grey,
          notchedShape: CircularNotchedRectangle(),
          onTabSelected: _onItemTap,
          items: [
            FABBottomAppBarItem2(
                iconData: home
                    ? Image.asset(
                        "assets/images/homeactiveicon.png",
                        height: 30,
                        width: 30,
                      )
                    : Image.asset("assets/images/homeicon.png",
                        height: 30, width: 30),
                text: 'Home'),
            FABBottomAppBarItem2(
                iconData: notes
                    ? Image.asset("assets/images/report_active_icon.png",
                        height: 30, width: 30)
                    : Image.asset("assets/images/report_icon.png",
                        height: 30, width: 30),
                text: 'Classes'),
            FABBottomAppBarItem2(
              iconData: notifications
                  ? Image.asset("assets/images/notification_active_icon.png",
                      height: 30, width: 30)
                  : Image.asset("assets/images/notification_icon.png",
                      height: 30, width: 30),
              text: 'Exams',
            ),
            FABBottomAppBarItem2(
                iconData: dwr
                    ? Image.asset("assets/images/menu_icon.png",
                        height: 30, width: 30)
                    : Image.asset("assets/images/menu_icon.png",
                        height: 30, width: 30),
                text: 'My Account'),
          ],
        ),
        body: KeyboardActions(
            config: _buildConfig(context),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: Color(0xffE6E6E6),
                      ),
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: vfuelText(text: "Deliver to")),
                        Text(
                          _selectedLocation!,
                          style: TextStyle(
                              color: vfuelColors.PrimaryTextColor,
                              fontFamily: "Poppins ExtraBold",
                              fontSize: 14),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 1,
                        ),
                        TextButton(
                          child: Text("Change"),
                          onPressed: () async {
                            goToDeliveryAdderessList(true);
                            print('tokken :::::');
                            print(await UserManager.instance.getToken());
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 220,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/images/banner_image.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //   topRight: Radius.circular(50),
                            //   topLeft: Radius.circular(50),
                            //),
                            //boxShadow: [
                            //  BoxShadow(
                            //   color: Colors.white,
                            //   offset: Offset(0.0, 1.0), //(x,y)
                            //  blurRadius: 6.0,
                            // ),
                            //],
                            ),
                        child: Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 20, left: 0, right: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: vfuelText(text: "Type"),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: vfuelColors.greenBoxBgColor,
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffE6E6E6),
                                        ),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      height: width * .22,
                                      width: width * .22,
                                      child: Center(
                                        child: vfuelText(
                                          text: configuration
                                              .products!.first.name,
                                          fontColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    vfuelText(text: "Today's Price"),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      configuration.products!.first.price !=
                                              null
                                          ? configuration.products!.first.price
                                              .toString()
                                          : "0",
                                      style: TextStyle(
                                          fontFamily: 'DS-DIGIB',
                                          fontSize: 55,
                                          fontWeight: FontWeight.bold,
                                          color: vfuelColors.ErrorIconColor),
                                    )
                                  ],
                                ),
                                Column(
                                  children: [
                                    vfuelText(text: "Select Qty"),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: vfuelColors.orangeBoxBgColor,
                                        border: Border.all(
                                          width: 1,
                                          color: Color(0xffE6E6E6),
                                        ),
                                        borderRadius:
                                            new BorderRadius.circular(10.0),
                                      ),
                                      height: width * .22,
                                      width: width * .22,
                                      child: Center(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            Container(
                                                width: 30,
                                                child: TextField(
                                                  inputFormatters: [
                                                    FilteringTextInputFormatter
                                                        .digitsOnly,
                                                    LengthLimitingTextInputFormatter(
                                                        4)
                                                  ],
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  textAlign: TextAlign.end,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      errorBorder:
                                                          InputBorder.none,
                                                      disabledBorder:
                                                          InputBorder.none),
                                                  focusNode: _nodeNumberType,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.white,
                                                    fontFamily: 'Poppins Bold',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  controller:
                                                      _fuelQuantityController,
                                                )),
                                            vfuelText(
                                                fontSize: 15.0,
                                                text: "L",
                                                fontColor: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ])),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    vfuelText(text: "Select Date"),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 40, right: 40),
                                      child: TextButton(
                                          onPressed: () {
                                            showCalender();
                                          },
                                          child: Text(Utils.getDateString(
                                              selectedDate))),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            )));
  }

  void showCalender() async {
    var today = DateTime.now();
    var lastDate = today.add(Duration(days: configuration.maxDate!));
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: lastDate);
    setState(() {
      if (picked == null) {
        selectedDate = DateTime.now();
      } else {
        selectedDate = picked;
      }
    });
  }

  /*

  Widget bottomNavigationTabs() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: new FractionalOffset(.5, 1.0),
      children: [

        BottomAppBarBar(

            selectedItemColor: Colors.orange,
            notchedShape: CircularNotchedRectangle(),


            items: [
              BottomNavigationBarItem(
                  activeIcon: Container(
                      height: 20,
                      width: 18,
                      child: Image.asset("assets/images/homeactiveicon.png")),
                  icon: Container(
                      height: 20,
                      width: 18,
                      child: Image.asset("assets/images/homeicon.png")),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Container(
                      height: 20,
                      width: 18,
                      child:
                          Image.asset("assets/images/report_active_icon.png")),
                  icon: Container(
                      height: 20,
                      width: 18,
                      child: Image.asset("assets/images/report_icon.png")),
                  label: ""),
              BottomNavigationBarItem(
                  activeIcon: Container(
                      height: 20,
                      width: 18,
                      child: Image.asset(
                          "assets/images/notification_active_icon.png")),
                  icon: Container(
                      height: 20,
                      width: 18,
                      child:
                          Image.asset("assets/images/notification_icon.png")),
                  label: ""),
              BottomNavigationBarItem(
                  icon: Container(
                      height: 20,
                      width: 18,
                      child: Image.asset("assets/images/menu_icon.png")),
                  label: "")
            ],

            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedTabIndex,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTap,
            elevation: 5

        ),


        Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: GestureDetector(
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    gradient: vfuelColors.buttonOrangeGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(0.0, 1.5),
                        blurRadius: 1.5,
                      ),
                    ]),
                child: new Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                if (selectedAddress != null &&
                    _fuelQuantityController.text != '0' &&
                    _fuelQuantityController.text != '') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OrderSummary(
                      selectedLocation: _selectedLocation,
                      qty: double.parse(_fuelQuantityController.text),
                      selectedAddress: selectedAddress,
                      selectedDate: selectedDate,
                      todayPrice: configuration.products.first.price != null
                          ? double.parse(
                              configuration.products.first.price.toString())
                          : 0,
                      productid: configuration.products.first.name,
                    );
                  }));
                } else {
                  Utils.showDialouge(context, AlertType.error, 'Error',
                      'Please select a delivery location and qunatity required',
                      okButtonCallBack: () {});
                }
              }),
        ),
      ],
    );
  }
*/

  _onItemTap(int? index) {
    setState(() {
      _selectedTabIndex = index;

      if (index == 0) {
        home = true;
        notes = false;
        notifications = false;
        dwr = false;
        conta = false;
        _name = __name2;
      } else if (index == 1) {
        home = false;
        notes = true;
        notifications = false;
        dwr = false;
        conta = false;
        _name = "Classes";
      } else if (index == 2) {
        notes = false;
        home = false;
        notifications = true;
        dwr = false;
        conta = false;
        _name = "Exams";
      } else if (index == 3) {
        home = false;
        notes = false;
        notifications = false;
        conta = false;
        _name = "My account";
        dwr = true;

        _key.currentState!.openDrawer();
      } else {
        _name = __name2;
      }
    });
    return _selectedTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: BlocListener<HomeCubit, HomeState>(
        bloc: _homeCubit,
        listener: (context, state) {
          if (state is HomeLoading || state is ProfileLoading) {
            Utils.showLoadingIndicator(context);
          } else if (state is HomeConfigurationFtechedSuccessfully) {
            Utils.dismissLoadingIndicator(context);
            setState(() {
              configuration = state.config;
            });
          } else if (state is ProfileFetchedSuccessfull) {
            Utils.dismissLoadingIndicator(context);
          } else if (state is HomeConfigurationFtechFailed ||
              state is ProfileLoadingFailed) {
            Utils.dismissLoadingIndicator(context);
          }
        },
        child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          if (state is HomeIntial) {
            _homeCubit.fetchConfiguration();

            return Container(
              color: Colors.white,
            );
          } else if (state is HomeConfigurationFtechedSuccessfully) {
            return homeDashboard();
          } else {
            return Container(
              color: Colors.white,
            );
          }
        }),
      ),
    );
  }
}

class FABBottomAppBarItem2 {
  Widget? iconData;
  String? text;
  FABBottomAppBarItem2({this.iconData, this.text});
}

class FABBottomAppBar2 extends StatefulWidget {
  FABBottomAppBar2({
    this.items,
    this.centerItemText,
    this.height: 60.0,
    this.iconSize: 24.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items!.length == 2 || this.items!.length == 4);
  }
  final List<FABBottomAppBarItem2>? items;
  final String? centerItemText;
  final double height;
  final double iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int?>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState2();
}

class FABBottomAppBarState2 extends State<FABBottomAppBar2> {
  int? _selectedIndex = 0;
  _updateIndex(int? index) {
    widget.onTabSelected!(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    //  items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem2? item,
    int? index,
    ValueChanged<int?>? onPressed,
  }) {
    Color? color =
        _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index),
            child: Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  item!.iconData!,
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    item.text!,
                    style: TextStyle(
                      color: color, fontSize: 9.0,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w400, // light
                      fontStyle: FontStyle.normal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
