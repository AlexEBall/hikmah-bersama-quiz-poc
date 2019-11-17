import 'package:flutter/foundation.dart';

@immutable
class TimerState {
  final int time;
  final bool paused;

  TimerState({@required this.time, @required this.paused});

  factory TimerState.inital() {
    return TimerState(
      time: 10,
      paused: false,
    );
  }

  TimerState copyWith({int time, bool paused}) {
    return TimerState(time: time ?? this.time, paused: paused ?? this.paused);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimerState &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          paused == other.paused;

  @override
  int get hashCode => time.hashCode ^ paused.hashCode;
}
