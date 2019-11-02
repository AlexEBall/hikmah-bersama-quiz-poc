import './app_state.dart';

import '../processing/processing_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return new AppState(processing: processingReducer(state.processing, action));
}
