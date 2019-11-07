import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:intro_slider/intro_slider.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/slides/slides_action.dart';
import 'package:hikmah_bersama_quiz_poc/screens/home.dart';
import 'package:hikmah_bersama_quiz_poc/screens/quiz.dart';

class IntroScreen extends StatelessWidget {
  static const String id = 'intro_screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      distinct: true,
      onInit: (store) {
        store.dispatch(InitSlides());
      },
      converter: (store) => store.state,
      builder: (context, state) => IntroPage(state),
      onDidChange: (state) {},
    );
  }
}

class IntroPage extends StatelessWidget {
  IntroPage(this.state);
  final AppState state;

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
        slides: state.slidesState.slides,
        nameDoneBtn: 'Get Started',
        onDonePress: () => Navigator.pushNamed(context, QuizScreen.id));
  }
}
