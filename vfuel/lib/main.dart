import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vfuel/pages/SplashScreen.dart';
import 'package:vfuel/pages/orders/order_track.dart';

import 'Utils/colors.dart';

void main() {
  set();
  runApp(vfuelApp());
}

class vfuelApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<vfuelApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
          theme: ThemeData(
              primaryColor: vfuelColors.PrimaryTextColor,
              primarySwatch: Colors.blue,
              textTheme: GoogleFonts.poppinsTextTheme(
                Theme.of(context).textTheme,
              )),
          home: SplashScreen(),
        ));
  }
}
