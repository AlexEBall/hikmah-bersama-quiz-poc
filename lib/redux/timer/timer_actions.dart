import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';

class Decrement {}

class Reset {}

ThunkAction<AppState> decrement() {
  return (Store<AppState> store) async {
    Stream<int> stream =
        Stream<int>.periodic(Duration(seconds: 1), (int value) => value);
    stream = stream.take(10);

    await for (int i in stream) {
      if (i < 9) {
        store.dispatch(Decrement());
      } else {
        store.dispatch(Reset());
        store.dispatch(resetQuestionState());
      }
    }
  };
}
