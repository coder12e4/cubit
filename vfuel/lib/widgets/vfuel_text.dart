import 'package:flutter/material.dart';
import 'package:vfuel/Utils/colors.dart';

class vfuelText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color? fontColor;
  final TextAlign alignment;
  final String font;
  const vfuelText(
      {Key? key,
      this.text,
      this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.fontColor = vfuelColors.PrimaryTextColor,
      this.alignment = TextAlign.center,
      this.font = "Poppins ExtraBold"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontFamily: font,
          fontSize: fontSize),
      textAlign: alignment,
    );
  }
}

class vfuelWrapperText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight fontWeight;
  final Color fontColor;
  final TextAlign alignment;
  final String font;
  final int lines;
  const vfuelWrapperText(
      {Key? key,
      this.text,
      this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.fontColor = vfuelColors.PrimaryTextColor,
      this.alignment = TextAlign.center,
      this.lines = 1,
      this.font = "Poppins ExtraBold"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
          color: fontColor,
          fontWeight: fontWeight,
          fontFamily: font,
          fontSize: fontSize),
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      softWrap: true,
      maxLines: lines,
    );
  }
}
