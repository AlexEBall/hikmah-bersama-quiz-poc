import 'package:flutter/material.dart';
import '../../store/quiz_state.dart';
import './actions.dart';

QuizState quiz_reducer(QuizState state, dynamic action) {
  // QuizState newState = QuizState.fromQuizState(prevState);

  return QuizState(colors: colorReducer(state.colors, action));
  // if (action is Processing) {
  //   newState.processing = action.payload;
  // }

  // print(newState.processing);

  // return newState;
}

List<Color> colorReducer(List<Color> state, action) {
  if (action is ResetColors) {
    return []
      ..setAll(0, [Colors.white, Colors.white, Colors.white, Colors.white]);
  }

  return state;
}
