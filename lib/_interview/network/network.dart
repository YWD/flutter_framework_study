import 'dart:convert';
import 'dart:io';

void main() async{
  // asyncM();
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {

    print(request.headers);
    request.listen((event) {
      String result = String.fromCharCodes(event);
      print('result:$result');
    });
    // Stream<String> stream = request.transform(utf8.decoder);
    // var header = HeaderValue.parse(request.headers['content-type']);
    // await for(MimeMultipart part in request.transform(MimeMultipartTransformer(header.parameters['boundary']))) {
    //   if (part.headers.containsKey('content-disposition')) {
    //     header = HeaderValue.parse(part.headers['content-disposition']);
    //     String filename = header.parameters['filename'];
    //     final file = new File(filename);
    //     IOSink fileSink = file.openWrite();
    //     await part.pipe(fileSink);
    //     fileSink.close();
    //   }
    // }


      request.response.write('Hello, world!');
    await request.response.close();
  }
}

void asyncM() async{
  HttpClient client = HttpClient();
  HttpClientRequest request = await client.get('www.example.com', 80, '');
  HttpClientResponse response = await request.close();
  Stream<String> stream = response.transform(utf8.decoder);
  // int length = await stream.length;
  int length = await stream.length;
  print('length:$length');
  // print('stream length:$length');
  // stream.listen((event) {
  //   print('result:$event');
  // });

  // HttpClient client = HttpClient();
  // print('open...');
  // HttpClientRequest request = await client.open('get', 'www.example.com', 80, '/');
  // print('request:$request');
  // HttpClientResponse response = await request.close();
  // print('response:$response');
  // client.close();
  // print('client close');

  // HttpClient client = HttpClient();
  // client.get('www.example.com', 80, '').then((request) {
  //   request.close().then((response) {
  //     print('status code:${response.statusCode}');
  //     print('response.toString:${response.toString()}');
  //     // response.transform(utf8.decoder).listen((contents) {
  //     //   print('contents:$contents');
  //     // });
  //     Stream<String> s = response.transform(utf8.decoder);
  //     // s.listen((event) {
  //     //   print('event:$event');
  //     // });
  //     print('s:$s');
  //   });
  // });
  // client.close();
}