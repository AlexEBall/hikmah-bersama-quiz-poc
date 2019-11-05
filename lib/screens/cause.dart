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
        store.dispatch(DestroyBannerAd());
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
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).accentColor
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.green,
                  child: Text('Picture'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.pink,
                  child: Text('stuff'),
                ),
              ),
              Expanded(
                flex: 1,
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
