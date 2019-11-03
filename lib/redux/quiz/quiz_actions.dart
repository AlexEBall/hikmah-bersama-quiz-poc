import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'package:flutter/foundation.dart';

class NextSubmit {}

class ResetColors {}

class IncrementCurrentIndex {}

class OneSecondDelay {
  final String correctAnswer;

  OneSecondDelay({this.correctAnswer});
}

class ChangeSelectedColor {
  final int index;

  ChangeSelectedColor({@required this.index});
}

class InformUserOfCorrectChoice {
  final String correctAnswer;

  InformUserOfCorrectChoice({@required this.correctAnswer});
}

ThunkAction oneSecondDelay(String correctAnswer) {
  return (Store store) async {
    String answer = await Future<String>.delayed(Duration(seconds: 1), () {
      print('1 second');
      return correctAnswer;
    });

    print('hey');
    print(answer);

    store.dispatch(InformUserOfCorrectChoice(correctAnswer: answer));
  };
}
