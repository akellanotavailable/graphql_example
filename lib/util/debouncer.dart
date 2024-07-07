import 'dart:async';

class Debouncer {
  Debouncer(this.callback);

  final Function callback;

  Timer? timer;

  void start(Duration time) {
    if (timer != null) {
      timer?.cancel();
      timer = Timer(time, () {
        timer = null;
        callback.call();
      });
    } else {
      timer = Timer(time, () {
        callback.call();
        timer = null;
      });
    }
  }
}
