import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:flutter/foundation.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';

class IncrementCurrentIndex {}

class ResetColors {}

class ChangeSelectedColor {
  final int index;

  ChangeSelectedColor({@required this.index});
}

class InformUserOfCorrectChoice {
  final String correctAnswer;

  InformUserOfCorrectChoice({@required this.correctAnswer});
}

// TODO: Refactore one second delay into function that takes actions
ThunkAction<AppState> oneSecondDelay(String correctAnswer) {
  return (Store<AppState> store) async {
    String answer = await Future<String>.delayed(Duration(seconds: 1), () {
      return correctAnswer;
    });

    return store.dispatch(InformUserOfCorrectChoice(correctAnswer: answer));
  };
}

ThunkAction<AppState> resetQuestionState() {
  return (Store<AppState> store) async {
    bool hasASecondPassed =
        await Future<bool>.delayed(Duration(seconds: 3), () {
      return true;
    });

    if (hasASecondPassed) {
      store.dispatch(ResetColors());

      // Todo: Need a global navigator to provide the conditional for this
      // and routing purposes
      store.dispatch(IncrementCurrentIndex());
    }
  };
}
