import 'package:flutter/material.dart';
import 'package:vfuel/Utils/colors.dart';

class vfuelAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final Color bgColor;
  @override
  final Size preferredSize;

  vfuelAppBar(
    this.title, {
    Key? key,
    this.bgColor = Colors.white,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
              color: vfuelColors.PrimaryTextColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded,
              color: vfuelColors.BackButtonBlueColor),
          iconSize: 25,
          onPressed: () {
            Navigator.pop(context);
          },
        ));
  }
}

class vfuelAppBarWithLogo extends StatelessWidget with PreferredSizeWidget {
  final String title;
  @override
  final Size preferredSize;

  vfuelAppBarWithLogo(
    this.title, {
    Key? key,
  })  : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        child: AppBar(
            backgroundColor: Color(0x00000000),
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 100,
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.fromLTRB(0.0, 18.0, 24.0, 0.0),
                  child: Image.asset(
                    "assets/images/logo_icon.png",
                    height: 78.0,
                    width: 65.0,
                  ),
                )
              ],
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back_rounded,
                  color: vfuelColors.BackButtonBlueColor),
              iconSize: 25,
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        preferredSize: Size.fromHeight(100.0));
  }
}

class vfuelCustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_rounded,
                color: vfuelColors.BackButtonBlueColor),
            iconSize: 25,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Container(
            height: 100,
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(0.0, 18.0, 24.0, 0.0),
            child: Image.asset(
              "assets/images/logo_icon.png",
              height: 78.0,
              width: 65.0,
            ),
          )
        ],
      ),
    );
  }
}
