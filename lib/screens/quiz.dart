import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_admob/firebase_admob.dart';

import '../models/question.dart';
import '../constants/constants.dart';
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
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: DotEnv().env['AD_MOD_ID']);
    bannerAd = buildBanner()..load();
  }

  @override
  void dispose() {
    super.dispose();
    bannerAd..dispose();
  }

  int _currentIndex = 0;
  // TODO: Final?
  List<Color> optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: DotEnv().env['TEST_AD_UNIT'] != null
        ? [DotEnv().env['TEST_AD_UNIT']]
        : null,
    keywords: ['Meditation', 'Philantrophy', 'Breathing', 'Yoga'],
  );

  BannerAd bannerAd;
  BannerAd buildBanner() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          bannerAd..show();
        }
        print(event);
      },
    );
  }

  void _nextSubmit(List<Color> colors) {
    new Timer(
      new Duration(seconds: 1),
      () {
        if (_currentIndex < (widget.questions.length - 1)) {
          setState(
            () {
              colors.setAll(
                  0, [Colors.white, Colors.white, Colors.white, Colors.white]);

              _currentIndex++;
            },
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (_) => QuizFinishedPage(
                  questions: widget.questions, answers: _answers),
            ),
          );
        }
      },
    );
  }

  // TODO: not functional, should be in a class
  void _changeSelectedColor(List<Color> colors, int index) {
    if (colors.contains(Colors.green)) {
      final int selected = colors.indexOf(Colors.green);
      colors.removeAt(selected);
      colors.add(Colors.white);
      setState(() {
        // TODO: add answer to the map
        // _answers[_currentIndex] = option;
        colors[index] = Colors.green;
      });
    } else {
      setState(() {
        // _answers[_currentIndex] = option;
        colors[index] = Colors.green;
      });
    }
  }

  void _informUserOfCorrectChoice(
      String correct, List<String> choices, List<Color> colors) {
    final int answer = choices.indexOf(correct);

    new Timer(new Duration(seconds: 1), () {
      setState(() {
        colors[answer] = Colors.orangeAccent;
      });

      _nextSubmit(colors);
    });
  }

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];

    final List<dynamic> options = question.incorrectAnswers;

    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    // Quit quiz logic
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
              clipper: WaveClipperOne(),
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
                        child: Text(widget.questions[_currentIndex].question,
                            style: kQuestionStyle),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, idx) {
                      return Container(
                        decoration: BoxDecoration(
                          color: optionsColor[idx],
                          border: Border.all(width: 1.0),
                        ),
                        child: ListTile(
                          title: Text(options[idx]),
                          onTap: () {
                            _changeSelectedColor(optionsColor, idx);
                            _informUserOfCorrectChoice(
                                question.correctAnswer, options, optionsColor);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
