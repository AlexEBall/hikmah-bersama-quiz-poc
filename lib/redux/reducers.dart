import '../store/app_state.dart';
import './actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  AppState newState = AppState.fromAppState(prevState);

  if (action is Processing) {
    newState.processing = action.payload;
  }

  print(newState.processing);

  return newState;
}
