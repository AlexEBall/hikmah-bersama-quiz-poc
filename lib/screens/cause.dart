import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:hikmah_bersama_quiz_poc/redux/app/app_state.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';

import 'package:hikmah_bersama_quiz_poc/components/ui/full_sized_image.dart';
import 'package:hikmah_bersama_quiz_poc/components/cause/profile_header.dart';
import 'package:hikmah_bersama_quiz_poc/components/cause/donation_header.dart';
import 'package:hikmah_bersama_quiz_poc/components/cause/description.dart';

class CauseScreen extends StatelessWidget {
  static const String id = 'cause_screen';

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      distinct: true,
      onInit: (store) {
        store.dispatch(BuildInterstitialAd(
            targetingInfo: store.state.adMobState.targetingInfo));
      },
      converter: (store) => store.state,
      builder: (context, state) => CausePage(state),
      onDidChange: (state) {},
    );
  }
}

class CausePage extends StatelessWidget {
  CausePage(this.state);
  final AppState state;

  @override
  Widget build(BuildContext context) {
    state.adMobState.bannerAd.dispose();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: FullSizeImage(image: 'cause'),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[DonationHeader(), ProfileHeader()],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Description(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
