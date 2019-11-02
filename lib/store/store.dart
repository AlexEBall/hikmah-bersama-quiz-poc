import 'package:redux/redux.dart';

import '../redux/app/app_state.dart';
import '../redux/app/app_reducer.dart';

Store<AppState> createStore() {
  return Store(appReducer, initialState: AppState.initial(), distinct: true);
}
