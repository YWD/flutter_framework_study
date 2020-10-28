import 'dart:async';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:http_client/curl.dart';
import 'package:shell/shell.dart';

void main() {
  get();
}

void get() async {
  int i = DateTime.now().millisecondsSinceEpoch;
  int ii = DateTime.now().millisecond;
  print('int1: $i');
  print('int2: $ii');
  List<int> ids = [4989, 4990, 4991];

  // var timer = Timer.periodic(Duration(milliseconds: 6), (timer) {
  //
  // });
  // Future.delayed(Duration(seconds: 1), () {
  //    timer.cancel();
  // });

  int endTime = DateTime(2020, 10, 28, 17, 16).millisecondsSinceEpoch;
  Timer timer;
  while(true) {
    int now = DateTime.now().millisecondsSinceEpoch;
    if (now < endTime) continue;

    timer = Timer.periodic(Duration(milliseconds: 5), (timer) {
      print('now: ${DateTime.now().millisecondsSinceEpoch}');
      for (int id in ids) {
        Process.run( 'curl', [
          'http://211.144.105.165/admissions/admissions/audit-material-info\u0021saveAppointment.action?&t=${now / 100}',
          '-H Accept: */*',
          '-H Referer: http://211.144.105.165/admissions/admissions/audit-material-info.action?id=27076',
          '-H X-Requested-With: XMLHttpRequest',
          '-H User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36',
          '-H Content-Type: application/x-www-form-urlencoded; charset=UTF-8',
          '--data-raw admissionInfo.submitMaterialInfo.id=$id&campus.id=143&admissionInfo.id=27076&checkbox1=on&checkbox2=on',
          '--compressed',
        ]).then((value) {
          print('result:${value.stdout}');
        });
      }
    });
    break;
  }

  Future.delayed(Duration(milliseconds: 300), () {
    timer.cancel();
  });

  // Process.run('curl', ['http://www.example.com']).then((value) {
  //   print('result:${value.stdout}');
  // });
}

/*

 */