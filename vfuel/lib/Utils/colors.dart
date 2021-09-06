import 'dart:ui';

import 'package:flutter/material.dart';

class vfuelColors {
  static const Color blackTextColor = Color.fromRGBO(2, 4, 51, 1);
  static const Color mediumGreyTextColor = Color.fromRGBO(103, 103, 103, 1);
  static const Color PrimaryTextColor = Color.fromRGBO(2, 66, 96, 1);
  static const Color DarkGreyTextColor = Color.fromRGBO(90, 90, 90, 1);
  static const Color LightGreyTextColor = Color.fromRGBO(149, 160, 182, 1);
  static const Color BackButtonBlueColor = Color.fromRGBO(38, 153, 251, 1);
  static const Color GreyTextColor = Color.fromRGBO(119, 129, 146, 1);
  static const Color LightGreyBGColor = Color.fromRGBO(235, 237, 239, 1);
  static const Color GreyImageBGColor = Color.fromRGBO(12, 112, 112, 1);
  static const Color SecondaryBGColor = Color.fromRGBO(239, 239, 239, 1);

  static const Color SuccessAlertImageBGColor =
      Color.fromRGBO(116, 180, 47, 0.29);
  static const Color ErrorAlertImageBGColor =
      Color.fromRGBO(242, 100, 44, 0.32);
  static const Color SuccessIconColor = Color.fromRGBO(116, 180, 47, 1);
  static const Color ErrorIconColor = Color.fromRGBO(242, 100, 44, 1);
  static const Color ErrorTextColor = Color.fromRGBO(213, 24, 44, 1);
  static const Color buttonOrageLightColor = Color.fromRGBO(254, 165, 57, 1);
  static const Color buttonOrageDarkColor = Color.fromRGBO(242, 100, 44, 1);
  static const Color buttonGreyBgColor = Color.fromRGBO(160, 160, 160, 1);
  static const Color buttonLighGreyTextColor = Color.fromRGBO(168, 168, 168, 1);
  static const Color greenBoxBgColor = Color.fromRGBO(116, 180, 47, 1);
  static const Color orangeBoxBgColor = Color.fromRGBO(254, 165, 57, 1);
  static const Color buttonLightGreyBgColor = Color.fromRGBO(242, 242, 242, 1);
  static const Color buttonLightDarkGreyBgColor =
      Color.fromRGBO(221, 221, 221, 1);
  static const Color buttonLightGreyBorderColor =
      Color.fromRGBO(216, 216, 216, 1);
  static const Color silverBgColor = Color.fromRGBO(168, 168, 168, 0.3);

  static const Color orangeTextColor = Color.fromRGBO(242, 100, 44, 1);

  static const Color greyTextColor = Color.fromRGBO(129, 129, 129, 1);

  static const Gradient buttonOrangeGradient = LinearGradient(
    colors: [buttonOrageDarkColor, buttonOrageLightColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient alertButtonOrangeGradient = LinearGradient(
    colors: [buttonOrageLightColor, buttonOrageDarkColor],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );

  static const Gradient alertButtonGreyGradient = LinearGradient(
    colors: [buttonLightDarkGreyBgColor, buttonLightDarkGreyBgColor],
    begin: Alignment.topLeft,
    end: Alignment.topRight,
  );
}
