import 'dart:async';

void main() {
  StreamController ctrl = StreamController();
  StreamSubscription subscription = ctrl.stream.listen((event) {
    print('the event: $event');
  });

  ctrl.sink.add('first event');
  ctrl.sink.add(3);

  ctrl.close();

  subscription.cancel();
  // Future.delayed(Duration(seconds: 3), () {
  //   subscription.cancel();  // if subscription cancel after ctrl immediately there will be no output.
  // });

  print('main end');
}