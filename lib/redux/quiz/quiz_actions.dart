import 'package:flutter/foundation.dart';

class NextSubmit {}

class ResetColors {}

class IncrementCurrentIndex {}

class ChangeSelectedColor {
  final int index;

  ChangeSelectedColor({@required this.index});
}

class InformUserOfCorrectChoice {
  final String correctAnswer;

  InformUserOfCorrectChoice({@required this.correctAnswer});
}
