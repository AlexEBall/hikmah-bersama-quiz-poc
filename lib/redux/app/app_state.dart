import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/slides/slides_state.dart';

// @immutable
class AppState {
  final bool processing;
  final QuizState quizState;
  final AdMobState adMobState;
  final SlidesState slidesState;

  AppState({
    @required this.processing,
    @required this.quizState,
    @required this.adMobState,
    @required this.slidesState,
  });

  factory AppState.initial() {
    return AppState(
        processing: false,
        quizState: QuizState.inital(),
        adMobState: AdMobState.inital(),
        slidesState: SlidesState.inital());
  }

  AppState copyWith(
      {bool processing,
      QuizState quizState,
      AdMobState adMobState,
      SlidesState slidesState}) {
    return AppState(
      processing: processing ?? this.processing,
      quizState: quizState ?? this.quizState,
      adMobState: adMobState ?? this.adMobState,
      slidesState: slidesState ?? this.slidesState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          processing == other.processing &&
          quizState == other.quizState &&
          adMobState == other.adMobState &&
          slidesState == other.slidesState;

  @override
  int get hashCode =>
      processing.hashCode ^
      quizState.hashCode ^
      adMobState.hashCode ^
      slidesState.hashCode;
}
