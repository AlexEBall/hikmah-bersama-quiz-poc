import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';
import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

final useQuizReducer = combineReducers<QuizState>([
  TypedReducer<QuizState, ChangeSelectedColor>(_changeSelectedColor),
  TypedReducer<QuizState, InformUserOfCorrectChoice>(
      _informUserOfCorrectChoice),
  TypedReducer<QuizState, ResetColors>(_resetColors),
  TypedReducer<QuizState, IncrementCurrentIndex>(_incrementCurrentIndex),
  TypedReducer<QuizState, AddAnswer>(_addAnswer),
]);

QuizState _changeSelectedColor(QuizState state, ChangeSelectedColor action) {
  final List<Color> colors = [...state.colors];

  if (colors.contains(kActive)) {
    final int selected = colors.indexOf((kActive));

    colors.removeAt(selected);
    colors.add(kPrimary);

    // TODO: Disable other choices

  } else {
    colors[action.index] = kActive;
  }

  return state.copyWith(colors: colors);
}

QuizState _informUserOfCorrectChoice(
    QuizState state, InformUserOfCorrectChoice action) {
  final List<Color> colors = state.colors.sublist(0);
  final int answer = state.options[state.currentIndex]
      .indexOf(state.questions[state.currentIndex].correctAnswer);
  colors[answer] = kSecondary;

  return state.copyWith(colors: colors);
}

QuizState _resetColors(QuizState state, ResetColors action) {
  final List<Color> colors = [kPrimary, kPrimary, kPrimary, kPrimary];

  return state.copyWith(colors: colors);
}

QuizState _incrementCurrentIndex(
    QuizState state, IncrementCurrentIndex action) {
  int curr = state.currentIndex;
  curr++;

  return state.copyWith(currentIndex: curr);
}

QuizState _addAnswer(QuizState state, AddAnswer action) {
  Map<String, String> m = {...state.answers};

  final String key = state.currentIndex.toString();

  m[key] = action.selection;
  return state.copyWith(answers: m);
}
