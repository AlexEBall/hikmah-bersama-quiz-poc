import 'package:flutter/material.dart';

import 'package:hikmah_bersama_quiz_poc/components/ui/circle_avatar.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Expanded(
              // Avatar
              flex: 3,
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: <Widget>[
                      CircleImage(height: 40.0, width: 40.0, image: 'avatar'),
                      SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Text('By Kaki King'),
                      )
                    ],
                  )),
            ),
            Expanded(
              // Number
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.people),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('23')
                  ],
                ),
              ),
            ),
            Expanded(
              // Number
              flex: 2,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text('15 days left')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
