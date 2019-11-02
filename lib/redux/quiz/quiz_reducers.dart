import 'package:redux/redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/quiz/quiz_state.dart';

final useQuizReducer = combineReducers<QuizState>([
  TypedReducer<QuizState, GetQuestions>(_getQuestions),
]);

// TODO: Don't think this should be a reducer as I'm not actually
// changing state. Could be just a getter on the class?
QuizState _getQuestions(QuizState state, GetQuestions action) {
  return state.copyWith(questions: state.questions);
}
