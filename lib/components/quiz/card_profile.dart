import 'package:flutter/material.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';

import 'package:hikmah_bersama_quiz_poc/components/ui/circle_avatar.dart';
import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

class CardProfile extends StatelessWidget {
  CardProfile({
    @required this.state,
  });

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleImage(height: 35.0, width: 35.0, image: 'avatar'),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Amanda',
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star, size: 18.0, color: kSecondary),
                        Text('2342'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        // Text(
        //   state.timerState.time.toString(),
        //   style: TextStyle(fontSize: 24.0, color: kSecondary),
        // )
      ],
    );
  }
}
