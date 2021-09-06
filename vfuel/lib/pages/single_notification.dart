import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(left: 25.0, right: 8.0, bottom: 21.0),
          width: double.infinity,
          height: 80.0,
          decoration: BoxDecoration(
            gradient: new LinearGradient(
                stops: [0.015, 0.015],
                colors: [Color(0xFF02344b), Colors.white]),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300]!.withOpacity(0.3),
                spreadRadius: 1.5,
                blurRadius: 2.5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 9.0, left: 18.0),
                child: Text(
                  "Order #749",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Poppins Medium",
                    color: Color(0xFF818181),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0, left: 18.0, bottom: 15.0),
                child: Text(
                  "Order Accepted",
                  style: TextStyle(
                    fontFamily: "Poppins SemiBold",
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4A6A84),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
