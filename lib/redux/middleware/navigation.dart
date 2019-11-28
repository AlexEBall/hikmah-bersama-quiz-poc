import 'package:redux/redux.dart';
import 'package:hikmah_bersama_quiz_poc/redux/keys.dart';
import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/navigation/navigation_actions.dart';

class NavigationMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigateTo) {
      // TODO: Test to see if this works with just pushedName
      Keys.navKey.currentState.popAndPushNamed(action.route);
    }

    next(action);
  }
}
