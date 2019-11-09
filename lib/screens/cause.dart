import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';

class CauseScreen extends StatelessWidget {
  static const String id = 'cause_screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      distinct: true,
      onInit: (store) {
        // TODO: Get this to work
        // store.dispatch(DestroyBannerAd());
      },
      converter: (store) => store.state,
      builder: (context, state) => CausePage(state),
      onDidChange: (state) {
        print(state.adMobState.bannerAd);
      },
    );
  }
}

class CausePage extends StatelessWidget {
  CausePage(this.state);
  final AppState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.green,
                  child: FittedBox(
                    child: Image.asset('assets/images/cause.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[DonationHeader(), ProfileHeader()],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.deepPurpleAccent,
                  child: Text('Yadda'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
          decoration: BoxDecoration(color: Colors.yellowAccent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                // Avatar
                flex: 3,
                child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(color: Colors.teal),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.red,
                        ),
                        SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Text('By Kaki King dsajfl afdjs'),
                        )
                      ],
                    )),
              ),
              Expanded(
                // Number
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(color: Colors.purpleAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.people),
                      SizedBox(
                        width: 12.0,
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
                  decoration: BoxDecoration(color: Colors.purpleAccent),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text('23')
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class DonationHeader extends StatelessWidget {
  const DonationHeader();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Row(
              //Title and Image Row
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text(
                        'Something sdkfj  fsldkj aslfj aasdlfj sfkljasd fklasjdf lask dfsljd ksljdf '),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 15.0),
                    decoration: BoxDecoration(color: Colors.red),
                    height: 50.0,
                    width: 50.0,
                    child: Text('hey'))
              ],
            ),
            Row(
              // Donation amount row
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'Something on the bottom here',
                    textAlign: TextAlign.left,
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
