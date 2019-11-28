import 'package:flutter/foundation.dart';
import 'package:firebase_admob/firebase_admob.dart';

class BuildBannerAd {
  final MobileAdTargetingInfo targetingInfo;

  BuildBannerAd({@required this.targetingInfo});
}

class BuildInterstitialAd {
  final MobileAdTargetingInfo targetingInfo;

  BuildInterstitialAd({@required this.targetingInfo});
}

class DestroyBannerAd {}
