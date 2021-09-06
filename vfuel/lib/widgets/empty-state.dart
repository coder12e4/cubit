import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vfuel/Utils/colors.dart';
import 'package:vfuel/widgets/vfuel_text.dart';

class EmptyStateView extends StatelessWidget {
  final String? title;
  final String? message;

  const EmptyStateView({Key? key, this.title, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            vfuelText(
              text: title,
              fontColor: vfuelColors.blackTextColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 20,
            ),
            vfuelText(
              text: message,
              fontColor: vfuelColors.mediumGreyTextColor,
              fontSize: 14,
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
