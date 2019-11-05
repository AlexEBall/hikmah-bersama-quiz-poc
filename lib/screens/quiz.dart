import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/processing/processing_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';

import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';
import './home.dart';
import './finished.dart';

// TODO: A view model will help to just pluck the state related to the quiz
class QuizScreen extends StatelessWidget {
  static const String id = 'quiz_screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      distinct: true,
      onInit: (store) {
        FirebaseAdMob.instance.initialize(appId: DotEnv().env['AD_MOD_ID']);
        store.dispatch(IsProcessing(false));
        store.dispatch(
            BuildBannerAd(targetingInfo: store.state.adMobState.targetingInfo));
      },
      converter: (store) => store.state,
      builder: (context, state) => QuizPage(state),
      onDidChange: (state) {},
    );
  }
}

class QuizPage extends StatelessWidget {
  QuizPage(this.state);
  final AppState state;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    state.adMobState.bannerAd
      ..load()
      ..show();
    return WillPopScope(
      onWillPop: () {
        return _onWillPop(context);
      },
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text('Philantropy Questions'),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${state.quizState.currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                            state
                                .quizState
                                .questions[state.quizState.currentIndex]
                                .question,
                            style: kQuestionStyle),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state
                        .quizState.options[state.quizState.currentIndex].length,
                    itemBuilder: (context, idx) {
                      return Container(
                        decoration: BoxDecoration(
                          color: state.quizState.colors[idx],
                          border: Border.all(width: 1.0),
                        ),
                        child: ListTile(
                          title: Text(state.quizState
                              .options[state.quizState.currentIndex][idx]),
                          onTap: () {
                            StoreProvider.of<AppState>(context)
                                .dispatch(ChangeSelectedColor(index: idx));

                            StoreProvider.of<AppState>(context)
                                .dispatch(oneSecondDelay());

                            StoreProvider.of<AppState>(context).dispatch(
                                AddAnswer(
                                    selection: state.quizState.options[
                                        state.quizState.currentIndex][idx]));

                            StoreProvider.of<AppState>(context)
                                .dispatch(resetQuestionState());
                            // _nextSubmit(context);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Quit quiz logic
Future<bool> _onWillPop(context) async {
  return showDialog<bool>(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: Text(
            "Are you sure you want to quit the quiz? All your progress will be lost."),
        title: Text("Warning!"),
        actions: <Widget>[
          FlatButton(
            child: Text("Yes"),
            onPressed: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
          ),
          FlatButton(
            child: Text("No"),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ],
      );
    },
  );
}
