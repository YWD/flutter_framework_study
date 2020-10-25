import 'dart:async';
import 'dart:io';

/// event loop
/// event queue and microtask queue

void main() {
  print('main start');
  sleep(Duration(seconds: 5));
  print('sleep finished');
  scheduleMicrotask(() {
    print('microtask 1');
  });
  scheduleMicrotask(() {
    print('microtask 2');
  });
  Timer.run(() {
    print('timer 1');
    scheduleMicrotask(() {
      print('microtask 4');
    });
  });
  Future(() {
    print('future1');
  }).then((value) {
    print('future 2');
    Future(() {
      print('future 3');
    });
  });
  Timer.run(() {
    print('timer 2');
  });
  scheduleMicrotask(() {
    print('microtask 3');
  });
  print('last line in main');


}