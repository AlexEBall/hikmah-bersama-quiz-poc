import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  Description();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          Text(
              "Because of the donations from people like you we're close to reaching our goal"),
          SizedBox(height: 50.0),
          Text('You got 9 out of 10 correct!')
        ],
      ),
    );
  }
}
