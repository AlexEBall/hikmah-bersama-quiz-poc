import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/app/app_reducer.dart';

Store<AppState> createStore() {
  return Store(appReducer,
      initialState: AppState.initial(),
      middleware: [thunkMiddleware],
      distinct: true);
}
