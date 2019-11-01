import 'package:flutter/material.dart';

class AppState {
  bool processing;

  AppState({@required this.processing});

  AppState.fromAppState(AppState another) {
    processing = another.processing;
  }
}
