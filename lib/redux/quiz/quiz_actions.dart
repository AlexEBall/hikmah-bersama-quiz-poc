import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter/foundation.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';

import 'package:hikmah_bersama_quiz_poc/screens/cause.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/navigation/navigation_actions.dart';

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

// ThunkAction<AppState> delayBy(int seconds) {
//   return (Store<AppState> store) async {
//     bool hasTimePassed =
//         await Future<bool>.delayed(Duration(seconds: seconds), () {
//       return true;
//     });

//     return hasTimePassed;
//   };
// }

// ThunkAction<AppState> resetQuestionState(bool skip) {
//   return (Store<AppState> store) async {
//     bool hasASecondPassed =
//         await Future<bool>.delayed(Duration(seconds: 2), () {
//       return true;
//     });

//     if (skip) {
//       // store.dispatch(ResetColors());

//       print('here');
//       if (store.state.quizState.currentIndex <
//           store.state.quizState.questions.length - 1) {
//         store.dispatch(IncrementCurrentIndex());
//         // store.dispatch(decrement());
//       } else {
//         store.dispatch(NavigateTo(route: CauseScreen.id));
//       }
//     }

//     if (hasASecondPassed) {
//       store.dispatch(ResetColors());

//       if (store.state.quizState.currentIndex <
//           store.state.quizState.questions.length - 1) {
//         store.dispatch(IncrementCurrentIndex());
//         store.dispatch(decrement());
//       } else {
//         store.dispatch(NavigateTo(route: CauseScreen.id));
//       }
//     }
//   };
// }
