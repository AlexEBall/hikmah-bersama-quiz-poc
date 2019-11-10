import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';

import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

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