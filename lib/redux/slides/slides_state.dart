import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:hikmah_bersama_quiz_poc/constants/constants.dart';

@immutable
class SlidesState {
  final List<Slide> slides;

  SlidesState({@required this.slides});

  factory SlidesState.inital() {
    return SlidesState(slides: [
      Slide(
        title: "Take a quiz",
        description: "Learn more about Islam.",
        // pathImage: "images/photo_eraser.png",
        backgroundColor: kSlides1,
      ),
      Slide(
        title: "Benefit a cause",
        description:
            "From each quiz you pass, we pay a portion to a non-profit charity",
        // pathImage: "images/photo_pencil.png",
        backgroundColor: kSlides2,
      ),
      Slide(
        title: "Help out",
        description: "Help families, end hunger",
        // pathImage: "images/photo_ruler.png",
        backgroundColor: kSlides3,
      ),
    ]);
  }

  SlidesState copyWith({List<Slide> slides}) {
    return SlidesState(slides: slides ?? this.slides);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SlidesState &&
          runtimeType == other.runtimeType &&
          slides == other.slides;

  @override
  int get hashCode => slides.hashCode;
}
