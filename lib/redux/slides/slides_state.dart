import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/slide_object.dart';

@immutable
class SlidesState {
  final List<Slide> slides;

  SlidesState({@required this.slides});

  factory SlidesState.inital() {
    return SlidesState(slides: [
      Slide(
        title: "ERASER",
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        // pathImage: "images/photo_eraser.png",
        backgroundColor: Color(0xfff5a623),
      ),
      Slide(
        title: "PENCIL",
        description:
            "Ye indulgence unreserved connection alteration appearance",
        // pathImage: "images/photo_pencil.png",
        backgroundColor: Color(0xff203152),
      ),
      Slide(
        title: "RULER",
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        // pathImage: "images/photo_ruler.png",
        backgroundColor: Color(0xff9932CC),
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
