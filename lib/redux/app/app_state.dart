import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

// @immutable
class AppState {
  final bool processing;

  AppState({@required this.processing});

  factory AppState.initial() {
    return AppState(processing: false);
  }

  AppState copyWith({bool processing}) {
    return AppState(processing: processing ?? this.processing);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          processing == other.processing;

  @override
  int get hashCode => processing.hashCode;
}
