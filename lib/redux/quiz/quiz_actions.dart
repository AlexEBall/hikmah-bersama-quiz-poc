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

class InformUserOfCorrectChoice {}

class AddAnswer {
  final String selection;

  AddAnswer({@required this.selection});
}

// TODO: Refactore one second delay into function that takes actions
ThunkAction<AppState> oneSecondDelay() {
  return (Store<AppState> store) async {
    bool hasASecondPassed =
        await Future<bool>.delayed(Duration(seconds: 1), () {
      return true;
    });

    if (hasASecondPassed) {
      return store.dispatch(InformUserOfCorrectChoice());
    }
  };
}

ThunkAction<AppState> resetQuestionState() {
  return (Store<AppState> store) async {
    bool hasASecondPassed =
        await Future<bool>.delayed(Duration(seconds: 2), () {
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
