import 'package:redux/redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_state.dart';

final useTimerReducer = combineReducers<TimerState>([
  TypedReducer<TimerState, Decrement>(_decrement),
  TypedReducer<TimerState, Reset>(_reset),
]);

TimerState _decrement(TimerState state, Decrement action) {
  int time = state.time;
  time--;

  return state.copyWith(time: time);
}

TimerState _reset(TimerState state, Reset action) {
  int time = 10;

  return state.copyWith(time: time);
}
