import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';

import 'package:hikmah_bersama_quiz_poc/screens/cause.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/navigation/navigation_actions.dart';

import 'package:hikmah_bersama_quiz_poc/utils/delayBy.dart';

import 'package:hikmah_bersama_quiz_poc/screens/cause.dart';

// TODO: This thunk action can be used to handle
// the async nature of changing quiz questions and
// figuring out if the quiz is over and user should continue
ThunkAction<AppState> nextLogic(int index, String selection) {
  return (Store<AppState> store) async {
    // TODO: this may have to be done with another action creator
    // 1. if time runs out
    //  select null as an answer
    //  disable all selctions (stretch)
    //  show the correct answer
    //  navigate to new screen and decrement

    // 2. if user selects an answer
    //  show selected
    //  disable all selections (stretch)
    //  show correct answer
    //  navigate to new screen and decrement
    if (selection is String) {
      store.dispatch(Pause(payload: true));
      store.dispatch(ChangeSelectedColor(index: index));
      await delayBy(1);
      store.dispatch(InformUserOfCorrectChoice());
      await delayBy(1);
      store.dispatch(ResetColors());
      if (store.state.quizState.currentIndex <
          store.state.quizState.questions.length - 1) {
        store.dispatch(IncrementCurrentIndex());
      } else {
        store.dispatch(DestroyBannerAd());
        store.dispatch(NavigateTo(route: CauseScreen.id));
      }
    }
  };
}
