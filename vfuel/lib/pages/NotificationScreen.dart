import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vfuel/pages/single_notification.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 98.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 27.0, bottom: 0.0),
              child: Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0xFF4A6A84),
                  fontFamily: "Poppins ExtraBold",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, position) {
                  return SingleNotification();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
