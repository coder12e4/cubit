import 'package:cheersclub/Utils/utils.dart';
import 'package:cheersclub/cubit/auth/Retourents/restourents_cubit.dart';
import 'package:cheersclub/cubit/repository/ResorentsListRepository.dart';
import 'package:cheersclub/models/SingleRestorent.dart';
import 'package:cheersclub/pages/PlaceOrder.dart';
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

class RestourentList extends StatefulWidget {
  const RestourentList({Key? key}) : super(key: key);

  @override
  _RestourentListState createState() => _RestourentListState();
}

class _RestourentListState extends State<RestourentList> {
  GlobalKey<ScaffoldState>? _key = GlobalKey();
  var Restourent_Controller = TextEditingController();

  late RestourentsCubit restourentsCubit;
  int? cart_count;
  List<SingleRestorent> restList = [];
  @override
  void initState() {
    restourentsCubit = RestourentsCubit(UserResListRepository());
    // TODO: implement initState
    restourentsCubit.loadrestourent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key!,
      endDrawer: drowerAfterlogin(),
      body: BlocProvider(
          create: (context) => restourentsCubit,
          child: BlocListener<RestourentsCubit, RestourentsState>(
            bloc: restourentsCubit,
            listener: (context, state) {
              if (state is RestourentsSucces) {
                restList = state.RestourentList;
              } else if (state is RestourentFail) {
                Utils.showDialouge(
                    context, AlertType.error, "Oops!", state.erroe);
              } else if (state is RestourentsSearchloading) {
                restList.clear();
              } else if (state is RestourentsSearchSucess) {
                restList = state.RestourentList;
              } else if (state is RestourentsSearcfail) {
                Utils.showDialouge(
                    context, AlertType.error, "Oops!", state.erroe);
              }
            },
            child: BlocBuilder<RestourentsCubit, RestourentsState>(
                builder: (context, state) {
              return RestForm();
            }),
          )),
    );
  }

  Widget RestForm() {
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
                        GestureDetector(
                          onTap: () {
                            _key!.currentState!.openEndDrawer();
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
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/w.png",
                    height: 56,
                    width: 56,
                  ),
                  CheersClubText(
                    text: "here do you want to create\nmemmory",
                    alignment: TextAlign.start,
                    fontColor: Colors.white,
                    fontSize: 16,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 0),
              // padding: EdgeInsets.only(top: 18),
              child: TextField(
                controller: Restourent_Controller,
                onChanged: (val) {
                  restourentsCubit.loadrestourentFilter(val);
                },
                cursorColor: Colors.amber,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search,
                    color: HexColor("59595B"),
                  ),
                  border: InputBorder.none,
                  //floatingLabelBehavior: true,
                  hintText: 'Search restaurents and friends',
                  hintStyle: TextStyle(
                    color: HexColor("59595B"),
                    fontSize: 16,
                  ),
                  filled: true,
                  fillColor: HexColor("28292C"),

                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 0.0, top: 16.0),

                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: HexColor("28292C")),
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 30, top: 20),
              child: Row(
                children: [
                  CheersClubText(
                    text: "Restaurents",
                    alignment: TextAlign.start,
                    fontColor: HexColor("ECB94F"),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )
                ],
              ),
            ),
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    childAspectRatio: (4.5 / 4),
                    children: List.generate(restList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext) => PlaceOrder(
                                        restouretId: restList[index].id,
                                        main: 1,
                                        sub: 4,
                                      )));

/*
                          PageTransition(
                              duration: Duration(milliseconds: 1000),
                              type: PageTransitionType.rightToLeft,
                              child: PlaceOrder(),
                              inheritTheme: true,
                              ctx: context);

 */
                        },
                        child: Container(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  "assets/images/items.png",
                                  height: 110,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 24, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 4,
                                    ),
                                    CheersClubText(
                                      text: restList[index].name,
                                      fontColor: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 0,
                                        ),
                                        Icon(
                                          Icons.location_on_rounded,
                                          size: 13,
                                          color: Colors.amber,
                                        ),
                                        CheersClubText(
                                          text: restList[index].name,
                                          fontColor: Colors.white,
                                          fontSize: 12,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
