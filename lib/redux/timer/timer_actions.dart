import 'dart:async';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter/foundation.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';

class Decrement {}

class Reset {}

class Pause {
  final bool payload;

  Pause({@required this.payload});
}

ThunkAction<AppState> decrement() {
  return (Store<AppState> store) async {
    Stream<int> stream =
        Stream<int>.periodic(Duration(seconds: 1), (int value) => value);
    stream.take(10);

    await for (int i in stream) {
      if (i < 9) {
        // print('decrementing');
        // print(store.state.timerState.paused);
        if (!store.state.timerState.paused) {
          store.dispatch(Decrement());
        }
      } else {
        // print('end of the contdown');
        store.dispatch(Pause(payload: false));
        store.dispatch(Reset());
      }
    }
  };
}

// class CounterBloc {
//   int _counter = 10;
//   StreamController<int> _countController = StreamController<int>();

//   Stream<int> get counterStream => _countController.stream;
//   StreamSink<int> get counterSink => _countController.sink;

//   void increamentCounter() {
//     _counter++;
//     counterSink.add(_counter);
//   }

//   void closeStream() {
//     _countController.close();
//   }
// }
