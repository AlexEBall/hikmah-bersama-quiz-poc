import 'package:flutter/foundation.dart';

class IncrementCurrentIndex {}

class ResetColors {}

class ChangeSelectedColor {
  final int index;

  ChangeSelectedColor({@required this.index});
}

class InformUserOfCorrectChoice {}

class AddAnswer {
  final String selection;

  AddAnswer({@required this.selection});
}
