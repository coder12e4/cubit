import 'package:cheersclub/localization/app_localization.dart';
import 'package:cheersclub/widgets/cheersclub_text.dart';
import 'package:cheersclub/widgets/drowers/drowers.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';
import 'Restourents_list.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  bool value = false;
  String? _chosenValue;

  changeLanguage(String language) {
    Locale _temp;
    switch (language) {
      case 'English':
        _temp = Locale('en', 'US');

        break;
      case 'French':
        _temp = Locale('fr', 'FR');
        break;
      default:
        _temp = Locale('en', 'US');
    }
    MyApp.setLocale(context, _temp);
  }

  void selectLanguage(String lang) {
    switch (lang) {
      case 'English':
        {}
        break;
      case 'France':
        {}
        break;

      case 'German':
        {}
        break;

      case 'Italian':
        {}
        break;

      default:
        print("something went wring");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      endDrawer: drowerAfterlogin(),
      resizeToAvoidBottomInset: false,
      body: Container(
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
                child: Row(
                  children: [
                    Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              duration: Duration(milliseconds: 1000),
                              type: PageTransitionType.rightToLeft,
                              child: RestourentList(),
                              inheritTheme: true,
                              ctx: context),
                        );
                      },
                      child: Container(
                        width: 120,
                        height: 40,
                        color: HexColor("FEC753"),
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(left: 30, top: 20, right: 30),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_sharp,
                              size: 16,
                            ),
                            CheersClubText(
                              text: AppLocalizations.of(context)
                                  .translate('Placeanorder'),
                              fontColor: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {});
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
                },
                child: Container(
                  height: 60,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 50,
                        color: HexColor("FEC753"),
                        margin: EdgeInsets.only(left: 30, top: 20),
                        child: Center(
                          child: const CheersClubText(
                            text: "SETTINGS",
                            fontColor: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 20, right: 20),
                child: Row(
                  children: [
                    CheersClubText(
                      text: "Allow all push notifications",
                      fontSize: 14,
                      fontColor: Colors.white,
                    ),
                    Expanded(child: SizedBox()),
                    Checkbox(
                      activeColor: HexColor("FEC753"),
                      side: BorderSide(color: Colors.white),
                      checkColor: Colors.white,
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 20, top: 20),
                child: Row(
                  children: [
                    CheersClubText(
                      text:
                          "Make location visible to all my \ncheers club friends",
                      fontSize: 14,
                      fontColor: Colors.white,
                      alignment: TextAlign.justify,
                    ),
                    Expanded(child: SizedBox()),
                    Checkbox(
                      activeColor: HexColor("FEC753"),
                      side: BorderSide(color: Colors.white),
                      checkColor: Colors.white,
                      value: this.value,
                      onChanged: (bool? value) {
                        setState(() {
                          this.value = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Row(
                  children: [
                    CheersClubText(
                      text: "Deactivate or suspent my account",
                      fontSize: 14,
                      fontColor: Colors.white,
                      alignment: TextAlign.justify,
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: Row(
                  children: [
                    CheersClubText(
                      text: "Language",
                      fontSize: 14,
                      fontColor: Colors.white,
                      alignment: TextAlign.justify,
                    ),
                    Expanded(child: SizedBox()),
                    DropdownButton<String>(
                      focusColor: Colors.white,
                      value: _chosenValue,
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      iconEnabledColor: Colors.black,
                      items: <String>[
                        'English',
                        'French',
                        'German',
                        'Italian',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Please choose a langauage",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _chosenValue = value;
                        });

                        changeLanguage(_chosenValue!);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
