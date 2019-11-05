import 'package:meta/meta.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_admob/firebase_admob.dart';

@immutable
class AdMobState {
  final MobileAdTargetingInfo targetingInfo;
  final BannerAd bannerAd;

  AdMobState({@required this.targetingInfo, this.bannerAd});

  factory AdMobState.inital() {
    return AdMobState(
      targetingInfo: MobileAdTargetingInfo(
        testDevices: DotEnv().env['TEST_AD_UNIT'] != null
            ? [DotEnv().env['TEST_AD_UNIT']]
            : null,
        keywords: ['Meditation', 'Philantrophy', 'Breathing', 'Yoga'],
      ),
    );
  }

  AdMobState copyWith(
      {MobileAdTargetingInfo targetingInfo, BannerAd bannerAd}) {
    return AdMobState(
      targetingInfo: targetingInfo ?? this.targetingInfo,
      bannerAd: bannerAd ?? this.bannerAd,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdMobState &&
          runtimeType == other.runtimeType &&
          targetingInfo == other.targetingInfo &&
          bannerAd == other.bannerAd;

  @override
  int get hashCode => targetingInfo.hashCode ^ bannerAd.hashCode;
}
