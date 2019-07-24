import 'dart:io';
import '../lib/dart-server.dart';
void main() {
  var dartServer = DartServer();
  dartServer.use(({req, res, next}) {
    // res..headers.contentType = new ContentType("application", "json", charset: "utf-8")
    //  ..write(jsonEncode({'hello': 'world'}));
    res.body = {'hello': 'world1'};
  });
  dartServer.listen(InternetAddress.loopbackIPv4, 3333);
}