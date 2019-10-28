import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';

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

  // String getAppId() {
  //   if (Platform.isIOS) {
  //     return DotEnv().env['AD_MOD_ID_IOS'];
  //   } else {
  //     return DotEnv().env['AD_MOD_ID'];
  //   }
  // }

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: DotEnv().env['TEST_AD_UNIT'] != null
        ? [DotEnv().env['TEST_AD_UNIT']]
        : null,
    keywords: ['Meditation', 'Philantrophy', 'Breathing', 'Yoga'],
  );

  BannerAd bannerAd;
  // InterstitialAd interstitialAd;

  BannerAd buildBanner() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        // if (event == MobileAdEvent.loaded) {
        //   bannerAd..show();
        // } else if (event == MobileAdEvent.closed) {
        //   interstitialAd = buildInterstitial()..load();
        // }
        print(event);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // print(widget.questions[0].question);
    FirebaseAdMob.instance.initialize(appId: DotEnv().env['AD_MOD_ID']);
    bannerAd = buildBanner()..load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    // interstitialAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bannerAd
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
      );

    Question question = widget.questions[_currentIndex];

    final List<dynamic> options = question.incorrectAnswers;

    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

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
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => QuizFinishedPage(
                questions: widget.questions, answers: _answers),
          ),
        );
      }
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
                      margin: EdgeInsets.only(bottom: 90.0),
                      child: RaisedButton(
                        child: Text(
                            _currentIndex == (widget.questions.length - 1)
                                ? "Submit"
                                : "Next"),
                        onPressed: _nextSubmit,
                      ),
                    ),
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
