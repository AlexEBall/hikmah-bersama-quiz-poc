import 'dart:async';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';

final useQuizReducer = combineReducers<QuizState>([
  TypedReducer<QuizState, GetQuestions>(_getQuestions),
  TypedReducer<QuizState, ChangeSelectedColor>(_changeSelectedColor),
  TypedReducer<QuizState, InformUserOfCorrectChoice>(
      _informUserOfCorrectChoice),
  TypedReducer<QuizState, ResetColors>(_resetColors),
  TypedReducer<QuizState, IncrementCurrentIndex>(_incrementCurrentIndex),
]);

// TODO: Don't think this should be a reducer as I'm not actually
// changing state. Could be just a getter on the class?
QuizState _getQuestions(QuizState state, GetQuestions action) {
  return state.copyWith(questions: state.questions);
}

QuizState _changeSelectedColor(QuizState state, ChangeSelectedColor action) {
  final List<Color> colors = [...state.colors];

  if (colors.contains(Color(0xff4caf50))) {
    final int selected = colors.indexOf((Color(0xff4caf50)));

    colors.removeAt(selected);
    colors.add(Color(0xFFFFFFFF));

    // TODO: Maybe add the ability to change selection
    // before clicking next?

  } else {
    colors[action.index] = Color(0xff4caf50);
  }

  return state.copyWith(colors: colors);
}

QuizState _informUserOfCorrectChoice(
    QuizState state, InformUserOfCorrectChoice action) {
  final List<Color> colors = [...state.colors];
  final int answer =
      state.options[state.currentIndex].indexOf(action.correctAnswer);

  colors[answer] = Color(0xFFFF9800);

  return state.copyWith(colors: colors);
}

QuizState _resetColors(QuizState state, ResetColors action) {
  final List<Color> colors = [
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF),
    Color(0xFFFFFFFF)
  ];

  return state.copyWith(colors: colors);
}

QuizState _incrementCurrentIndex(
    QuizState state, IncrementCurrentIndex action) {
  int curr = state.currentIndex;
  curr++;

  return state.copyWith(currentIndex: curr);
}
