import 'dart:io';
import '../lib/dart-server.dart';
void main() async {
  var dartServer = DartServer();

  dartServer.use(({req, res, next}) async {
    print('income');
    int start = DateTime.now().millisecondsSinceEpoch;
    await next();
    int ms = DateTime.now().millisecondsSinceEpoch - start;
    print('X-Response-Time $ms ms');
    print('outcome');
  });

  dartServer.use(({req, res, next}) {
    req.params[3] = 5;
    print('-----------');
    print(req.params);
    print(req.query);
    print(req.body);
    // res..headers.contentType = new ContentType("application", "json", charset: "utf-8")
    //  ..write(jsonEncode({'hello': 'world'}));
    res.body = {'hello': 'world1'};
  });
  await dartServer.listen(InternetAddress.loopbackIPv4, 3333);
}