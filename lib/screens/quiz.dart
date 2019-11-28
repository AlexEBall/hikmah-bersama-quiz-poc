import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';

import 'package:hikmah_bersama_quiz_poc/components/quiz/quiz_card.dart';

class QuizScreen extends StatelessWidget {
  static const String id = 'quiz_screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      distinct: true,
      onInit: (store) {
        FirebaseAdMob.instance.initialize(appId: DotEnv().env['AD_MOD_ID']);
        // store.dispatch(
        // BuildBannerAd(targetingInfo: store.state.adMobState.targetingInfo));
      },
      converter: (store) => store.state,
      builder: (context, state) => QuizPage(state),
      onDidChange: (state) {},
      onDispose: (store) {},
    );
  }
}

class QuizPage extends StatelessWidget {
  final AppState state;

  QuizPage(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Philantropy Questions',
          style: TextStyle(color: Colors.white70),
        ),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Stack(
          children: <Widget>[QuizCard(state: state)],
        ),
      ),
    );
  }
}
