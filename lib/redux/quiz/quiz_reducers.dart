import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';

final useQuizReducer = combineReducers<QuizState>([
  TypedReducer<QuizState, GetQuestions>(_getQuestions),
  TypedReducer<QuizState, ChangeSelectedColor>(_changeSelectedColor),
]);

// TODO: Don't think this should be a reducer as I'm not actually
// changing state. Could be just a getter on the class?
QuizState _getQuestions(QuizState state, GetQuestions action) {
  return state.copyWith(questions: state.questions);
}

QuizState _changeSelectedColor(QuizState state, ChangeSelectedColor action) {
  // print('hey');
  // List<Color> colors = state.colors;

  // if (state.colors.contains(Color(0xff4caf50))) {
  //   final int selected = state.colors.indexOf((Colors.green));

  //   print('hey 2');
  //   colors.removeAt(selected);
  //   colors.add(Color(0xffffffff));
  //   return state.copyWith(colors: colors);
  // } else {
  //   print('do I get here');
  //   colors[action.index] = Color(0xff4caf50);
  //   print(colors);
  //   return state.copyWith(colors: colors);
  // }

  return state.copyWith(selected: action.index);
}
