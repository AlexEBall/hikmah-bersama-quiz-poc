import 'package:redux/redux.dart';
import 'package:intro_slider/slide_object.dart';

import 'package:hikmah_bersama_quiz_poc/redux/slides/slides_action.dart';
import 'package:hikmah_bersama_quiz_poc/redux/slides/slides_state.dart';

final useSlidesReducer = combineReducers<SlidesState>([
  TypedReducer<SlidesState, InitSlides>(_changeSelectedColor),
]);

SlidesState _changeSelectedColor(SlidesState state, InitSlides action) {
  final List<Slide> slides = [...state.slides];

  return state.copyWith(slides: slides);
}
