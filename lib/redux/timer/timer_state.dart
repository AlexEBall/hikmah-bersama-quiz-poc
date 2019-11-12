import 'package:flutter/foundation.dart';

@immutable
class TimerState {
  final int time;

  TimerState({@required this.time});

  factory TimerState.inital() {
    return TimerState(
      time: 10,
    );
  }

  TimerState copyWith({int time}) {
    return TimerState(
      time: time ?? this.time,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerState &&
          runtimeType == other.runtimeType &&
          time == other.time;

  @override
  int get hashCode => time.hashCode;
}
