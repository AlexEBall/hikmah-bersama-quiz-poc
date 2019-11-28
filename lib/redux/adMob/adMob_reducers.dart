import 'package:redux/redux.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_state.dart';

final useAdMobReducer = combineReducers<AdMobState>([
  TypedReducer<AdMobState, BuildBannerAd>(_buildBanner),
  TypedReducer<AdMobState, DestroyBannerAd>(_destroyBanner),
  TypedReducer<AdMobState, BuildInterstitialAd>(_buildInerstitial),
]);

AdMobState _buildBanner(AdMobState state, BuildBannerAd action) {
  BannerAd banner = state.bannerAd;

  banner = BannerAd(
      adUnitId: BannerAd.testAdUnitId,
      size: AdSize.smartBanner,
      targetingInfo: action.targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          banner..show();
        }
      })
    ..load();

  return state.copyWith(bannerAd: banner);
}

AdMobState _buildInerstitial(AdMobState state, BuildInterstitialAd action) {
  InterstitialAd interstitial = state.interstitialAd;

  interstitial = InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: action.targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.loaded) {
          interstitial..show();
        }
      })
    ..load();

  return state.copyWith(interstitialAd: interstitial);
}

AdMobState _destroyBanner(AdMobState state, DestroyBannerAd action) {
  BannerAd banner = state.bannerAd;
  banner = null;

  print(banner == null);
  return state.copyWith(bannerAd: null);
}
