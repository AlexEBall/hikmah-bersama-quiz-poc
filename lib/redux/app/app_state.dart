import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/slides/slides_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/timer/timer_state.dart';

// @immutable
class AppState {
  // final bool processing;
  final QuizState quizState;
  final AdMobState adMobState;
  final SlidesState slidesState;
  final TimerState timerState;

  AppState(
      {
      // @required this.processing,
      @required this.quizState,
      @required this.adMobState,
      @required this.slidesState,
      @required this.timerState});

  factory AppState.initial() {
    return AppState(
        // processing: false,
        quizState: QuizState.inital(),
        adMobState: AdMobState.inital(),
        slidesState: SlidesState.inital(),
        timerState: TimerState.inital());
  }

  AppState copyWith(
      {
      // bool processing,
      QuizState quizState,
      AdMobState adMobState,
      SlidesState slidesState,
      TimerState tiemrState}) {
    return AppState(
        // processing: processing ?? this.processing,
        quizState: quizState ?? this.quizState,
        adMobState: adMobState ?? this.adMobState,
        slidesState: slidesState ?? this.slidesState,
        timerState: timerState ?? this.timerState);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          // processing == other.processing &&
          quizState == other.quizState &&
          adMobState == other.adMobState &&
          slidesState == other.slidesState &&
          timerState == other.timerState;

  @override
  int get hashCode =>
      // processing.hashCode ^
      quizState.hashCode ^
      adMobState.hashCode ^
      slidesState.hashCode ^
      timerState.hashCode;
}
