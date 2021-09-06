import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textButton(String title, Function onTap) {
  return GestureDetector(
    child: Container(
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.sourceSansPro(
            fontSize: 16,
            color: Color(0xff024260),
          ),
        ),
      ),
      height: 44,
      width: 144,
      margin: EdgeInsets.only(left: 0, right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xff024260),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onTap: onTap as void Function()?,
  );
}
