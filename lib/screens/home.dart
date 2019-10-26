import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_admob/firebase_admob.dart';

import './error.dart';
import './quiz.dart';
import '../models/question.dart';
import '../services/quiz_api_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool processing;

  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices:
        DotEnv().env['AD_MOD_ID'] != null ? [DotEnv().env['AD_MOD_ID']] : null,
    keywords: ['Meditation', 'Philantrophy', 'Breathing', 'Yoga'],
  );

  BannerAd bannerAd;
  InterstitialAd interstitialAd;

  BannerAd buildBanner() {
    return BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
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

  InterstitialAd buildInterstitial() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          interstitialAd = buildInterstitial()..load();
        }
        print(event);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    processing = false;

    FirebaseAdMob.instance.initialize(appId: DotEnv().env['AD_MOD_ID']);
    bannerAd = buildBanner()..load();
    // interstitialAd = buildInterstitial()..load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    // interstitialAd?.dispose();
    super.dispose();
  }

  void _startQuiz() async {
    setState(() {
      processing = true;
    });
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
    setState(() {
      processing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bannerAd
      ..load()
      ..show();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mindful Philanthopy'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
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
              onPressed: () => _startQuiz(),
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
      ),
    );
  }
}
