import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:hikmah_bersama_quiz_poc/screens/home.dart';
import 'package:html_unescape/html_unescape.dart';

import '../models/question.dart';
import './home.dart';
import './finished.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz_screen';
  final List<Question> questions;

  QuizScreen({@required this.questions});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final TextStyle _questionStyle = TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.white);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    print(widget.questions[0].question);
  }

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    print(options);

    void _nextSubmit() {
      if (_answers[_currentIndex] == null) {
        _key.currentState.showSnackBar(SnackBar(
          content: Text("You must select an answer to continue."),
        ));
        return;
      }
      if (_currentIndex < (widget.questions.length - 1)) {
        setState(() {
          _currentIndex++;
        });
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (_) => QuizFinishedPage(
                questions: widget.questions, answers: _answers)));
      }
    }

    Future<bool> _onWillPop() async {
      return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the quiz? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        key: _key,
        appBar: AppBar(
          title: Text('Philantropy Questions'),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        child: Text("${_currentIndex + 1}"),
                      ),
                      SizedBox(width: 16.0),
                      Expanded(
                        child: Text(
                          HtmlUnescape().convert(
                              widget.questions[_currentIndex].question),
                          softWrap: true,
                          style: _questionStyle,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ...options.map(
                          (option) => RadioListTile(
                            title: Text(HtmlUnescape().convert("$option")),
                            groupValue: _answers[_currentIndex],
                            value: option,
                            onChanged: (value) {
                              setState(() {
                                _answers[_currentIndex] = option;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: RaisedButton(
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Submit"
                                : "Next"),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
