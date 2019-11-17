import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:hikmah_bersama_quiz_poc/redux/processing/processing_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';

import './error.dart';
import './quiz.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';

  // void _startQuiz(context) {
  //   try {
  //     Navigator.pop(context);
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => QuizScreen(),
  //       ),
  //     );
  //   } on SocketException catch (_) {
  //     StoreProvider.of<AppState>(context).dispatch(IsProcessing(false));
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => ErrorPage(
  //           message:
  //               "Can't reach the servers, \n Please check your internet connection.",
  //         ),
  //       ),
  //     );
  //   } catch (e) {
  //     print(e.message);
  //     StoreProvider.of<AppState>(context).dispatch(IsProcessing(false));
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //         builder: (_) => ErrorPage(
  //           message: "Unexpected error trying to connect to the API",
  //         ),
  //       ),
  //     );
  //   }
  // }

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
                  decoration: BoxDecoration(color: Colors.red),
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
                    // TODO: Use processing for a spinner widget
                    // StoreProvider.of<AppState>(context)
                    //     .dispatch(IsProcessing(true));
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
