import 'dart:async';

FutureOr<bool> delayBy(seconds) async {
  bool delayed = await Future<bool>.delayed(Duration(seconds: seconds), () {
    return true;
  });
  return delayed;
}
