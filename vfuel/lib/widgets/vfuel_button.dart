import 'package:flutter/material.dart';

class vfuelButton extends StatelessWidget {
  final Gradient? gradient;
  final double width;
  final double height;
  final Function? onPressed;
  final String? title;
  final Color? textColor;
  final double cornerRadius;
  const vfuelButton({
    Key? key,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
    this.title,
    this.textColor,
    this.cornerRadius = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500]!,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(cornerRadius))),
      child: InkWell(
          onTap: onPressed as void Function()?,
          child: Center(
            child: Text(title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textColor,
                  fontFamily: "Poppins Bold",
                )),
          )),
    );
  }
}
