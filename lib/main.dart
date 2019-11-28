import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:hikmah_bersama_quiz_poc/store/store.dart';
import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/keys.dart';
import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

import 'package:hikmah_bersama_quiz_poc/screens/intro.dart';
import 'package:hikmah_bersama_quiz_poc/screens/home.dart';
import 'package:hikmah_bersama_quiz_poc/screens/quiz.dart';
import 'package:hikmah_bersama_quiz_poc/screens/error.dart';
import 'package:hikmah_bersama_quiz_poc/screens/finished.dart';
import 'package:hikmah_bersama_quiz_poc/screens/cause.dart';

Future main() async {
  final store = createStore();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await DotEnv().load('.env');
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Hikmah / Bersams Quiz POC',
        navigatorKey: Keys.navKey,
        theme: ThemeData(
          primaryColor: kPrimary,
          accentColor: kSecondary,
          fontFamily: "UnicaOne",
          buttonColor: kActive,
          buttonTheme: ButtonThemeData(
              buttonColor: kActive,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              textTheme: ButtonTextTheme.primary),
        ),
        initialRoute: IntroScreen.id,
        routes: {
          IntroScreen.id: (context) => IntroScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          QuizScreen.id: (context) => QuizScreen(),
          QuizFinishedPage.id: (context) => QuizFinishedPage(),
          CauseScreen.id: (context) => CauseScreen(),
          ErrorPage.id: (context) => ErrorPage(),
        },
      ),
    );
  }
}
