import 'dart:io';
import 'dart-server-request.dart';
import 'dart-server-response.dart';
class DartServer {
  HttpServer _server;
  List _middlewares = [];

  // 单例
  static final DartServer _dartServer = new DartServer._internal();
  factory DartServer() {
    return _dartServer;
  }
  DartServer._internal();

  void use(middleware) {
    _middlewares.add(middleware);
  }
  listen (address, int port, {int backlog: 0, bool v6Only: false, bool shared: false}) async {
    _server = await HttpServer.bind(address, port, backlog: backlog, v6Only: v6Only, shared: shared);
    await for (var request in _server) {
      for (final middleware in _middlewares) {
        bool shouldBreak = true;
        await middleware(req: DartServerRequest(request), res: DartServerResponse(request.response), next: () {
          shouldBreak = false;
        });
        if (shouldBreak) {
          request.response.close();
          break;
        }
      }
    }
  }
}
