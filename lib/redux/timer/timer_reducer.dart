import 'package:redux/redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_state.dart';

final useTimerReducer = combineReducers<TimerState>([
  TypedReducer<TimerState, Decrement>(_decrement),
  TypedReducer<TimerState, Reset>(_reset),
  TypedReducer<TimerState, Pause>(_pause),
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

TimerState _pause(TimerState state, Pause action) {
  // print(action.payload);
  // bool paused = action.payload;

  return state.copyWith(paused: action.payload);
}
