import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape.dart';
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
  Color color = Colors.amberAccent;
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
    super.dispose();
    bannerAd..dispose();
  }

  List<Color> optionsColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  // TODO: not functional, should be in a class
  void _changeSelectedColor(List<Color> colors, int index) {
    if (colors.contains(Colors.green)) {
      final int selected = colors.indexOf(Colors.green);
      colors.removeAt(selected);
      colors.add(Colors.white);
      setState(() {
        colors[index] = Colors.green;
      });
    } else {
      setState(() {
        colors[index] = Colors.green;
      });
    }
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

    // TODO: Isn't this unnecessary?
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      // TODO: Create a function that
      options.shuffle();
    }

    void _nextSubmit() {
      if (_answers[_currentIndex] == null) {
        // TODO: Refactor this
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
                            // TODO: create a timer that before proceeding
                            // shows the correct answer in another color (than white or green)
                          },
                        ),
                      );
                    },
                  ),

                  // <Widget>[
                  //   ...options.map(
                  //     (option) => Container(
                  //       decoration: BoxDecoration(
                  //         color: color,
                  //         border: Border.all(width: 1.5),
                  //       ),
                  //       child: RadioListTile(
                  //         title: Text(option),
                  //         groupValue: _answers[_currentIndex],
                  //         value: option,
                  //         onChanged: (value) {
                  //           print(question.question);
                  //           print(question.correctAnswer);
                  //           print(question.incorrectAnswers);

                  //           setState(() {
                  //             color = kSelectedColor;
                  //           });

                  //           Future.delayed(
                  //               const Duration(milliseconds: 500), () {
                  //             // Here you can write your code
                  //             setState(() {
                  //               // Here you can write your code for open new view
                  //               _answers[_currentIndex] = option;
                  //             });
                  //           });

                  //           // setState(() {
                  //           //   _answers[_currentIndex] = option;
                  //           // });
                  //         },
                  //       ),
                  //     ),
                  //   ),
                  // ],
                  // ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      // TODO: Adjust for android and ios
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
