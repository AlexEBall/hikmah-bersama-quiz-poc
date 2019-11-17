import './app_state.dart';

import 'package:hikmah_bersama_quiz_poc/redux/processing/processing_reducers.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_reducers.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_reducers.dart';
import 'package:hikmah_bersama_quiz_poc/redux/slides/slides_reducer.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(
      // processing: processingReducer(state.processing, action),
      quizState: useQuizReducer(state.quizState, action),
      adMobState: useAdMobReducer(state.adMobState, action),
      slidesState: useSlidesReducer(state.slidesState, action),
      timerState: useTimerReducer(state.timerState, action));
}
