import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

class DonationHeader extends StatelessWidget {
  DonationHeader();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        // decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              //Title and Image Row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                      'Help rebuild their school',
                      style: TextStyle(fontSize: 28.0),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                  height: 50.0,
                  width: 50.0,
                  child: CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 5.0,
                    animation: true,
                    percent: 0.7,
                    center: Text(
                      "70%",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Theme.of(context).primaryColor,
                  ),
                )
              ],
            ),
            Row(
              // Donation amount row
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: '\$125,000',
                            style: TextStyle(color: kActive)),
                        TextSpan(text: ' funds collected from \$500,000')
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
