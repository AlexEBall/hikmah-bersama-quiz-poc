import 'package:redux/redux.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_actions.dart';
import 'package:hikmah_bersama_quiz_poc/redux/adMob/adMob_state.dart';

final useAdMobReducer = combineReducers<AdMobState>([
  TypedReducer<AdMobState, BuildBannerAd>(_buildBanner),
  TypedReducer<AdMobState, DestroyBannerAd>(_destroyBanner),
]);

AdMobState _buildBanner(AdMobState state, BuildBannerAd action) {
  BannerAd banner = state.bannerAd;

  banner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    targetingInfo: action.targetingInfo,
  );

  return state.copyWith(bannerAd: banner);
}

AdMobState _destroyBanner(AdMobState state, DestroyBannerAd action) {
  BannerAd banner = state.bannerAd;

  // print('am I here?');
  // banner = null;
  banner.dispose();

  return state.copyWith(bannerAd: banner);
}
