import 'package:flutter/material.dart';

class ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: Center(
        child: Row(
          children: [
            CircularProgressIndicator(),
            Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
          ],
        ),
      ),
    ));
  }
}
