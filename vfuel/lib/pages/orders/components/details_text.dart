import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget detailsText({required String title, required String detail}) {
  return Padding(
    padding: const EdgeInsets.only(top: 5, bottom: 5),
    child: Row(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xff9B9B9B),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          detail,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Color(0xff4E4E4E),
          ),
        ),
      ],
    ),
  );
}
