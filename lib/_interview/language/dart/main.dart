// todo
// .call
import 'dart:async';

import 'dart:io';

/// covariant

void main() {
  Function f = printSomething;
  var result = f.call(something: 'something');
  print('===========result:$result');
  result = f(something: 'He He');
  print('===========result:$result');
}

void printSomething({String something}) {
  print('print something: $something');
}