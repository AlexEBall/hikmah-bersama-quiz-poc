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
    // state.adMobState.bannerAd
    //   ..load()
    //   ..show();
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
        body: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: Stack(
            children: <Widget>[new QuizCard(state: state)],
          ),
        ),
      ),
    );
  }
}

class QuizCard extends StatelessWidget {
  const QuizCard({
    @required this.state,
  });

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
          color: kCard),
      margin: EdgeInsets.fromLTRB(15.0, 40.0, 15.0, 90.0),
      padding: EdgeInsets.all(16.0),
      // height: 450,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.white70,
                child: Text("${state.quizState.currentIndex + 1}"),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Text(
                    state.quizState.questions[state.quizState.currentIndex]
                        .question,
                    style: kQuestionStyle),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 16,
              );
            },
            itemCount:
                state.quizState.options[state.quizState.currentIndex].length,
            itemBuilder: (context, idx) {
              return Container(
                decoration: BoxDecoration(
                    color: state.quizState.colors[idx],
                    borderRadius: BorderRadius.circular(4.0)),
                child: ListTile(
                  title: Text(state
                      .quizState.options[state.quizState.currentIndex][idx]),
                  onTap: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(ChangeSelectedColor(index: idx));

                    StoreProvider.of<AppState>(context)
                        .dispatch(oneSecondDelay());

                    StoreProvider.of<AppState>(context).dispatch(AddAnswer(
                        selection: state.quizState
                            .options[state.quizState.currentIndex][idx]));

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
