import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../redux/actions.dart';
import '../store/app_state.dart';

import './error.dart';
import './quiz.dart';
import '../models/question.dart';
import '../services/quiz_api_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  void _startQuiz(context) async {
    print(context);
    try {
      List<Question> questions = await getQuestions();
      Navigator.pop(context);

      if (questions.length < 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ErrorPage(
              message:
                  "There are not enough questions in the category, with the options you selected.",
            ),
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => QuizScreen(
            questions: questions,
          ),
        ),
      );
    } on SocketException catch (_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ErrorPage(
            message:
                "Can't reach the servers, \n Please check your internet connection.",
          ),
        ),
      );
    } catch (e) {
      print(e.message);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ErrorPage(
            message: "Unexpected error trying to connect to the API",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindful Philanthopy'),
        elevation: 0,
      ),
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipperOne(),
                child: Container(
                  decoration: BoxDecoration(
                      color: state.processing
                          ? Colors.red
                          : Theme.of(context).primaryColor),
                  height: 100,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0),
                width: 100,
                height: 100,
                child: MaterialButton(
                  elevation: 1.0,
                  highlightElevation: 1.0,
                  onPressed: () {
                    StoreProvider.of<AppState>(context)
                        .dispatch(Processing(true));
                    // print(state.processing);
                    // _startQuiz(context);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Theme.of(context).accentColor,
                  textColor: Colors.white70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Donate to a charity',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
