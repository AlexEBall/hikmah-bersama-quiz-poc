import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';

// @immutable
class AppState {
  final bool processing;
  final QuizState quizState;

  AppState({@required this.processing, @required this.quizState});

  factory AppState.initial() {
    return AppState(processing: false, quizState: QuizState.inital());
  }

  AppState copyWith({bool processing, QuizState quizState}) {
    return AppState(
      processing: processing ?? this.processing,
      quizState: quizState ?? this.quizState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          processing == other.processing &&
          quizState == other.quizState;

  @override
  int get hashCode => processing.hashCode ^ quizState.hashCode;
}
