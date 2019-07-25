import 'dart:io';
import 'dart-server-request.dart';
import 'dart-server-response.dart';
import 'package:angel_route/angel_route.dart';
class DartServer {

  final router = new Router();

  HttpServer _server;
  final List _middlewares = List();

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
    // _server.listen((req) async {});
    await for (var request in _server) {
      List copedMiddlewares = List.from(_middlewares);
      DartServerRequest req = DartServerRequest(request);
      DartServerResponse res = DartServerResponse(request.response);
      await req.analysisAsync();

      runMiddlewaresWithRequestResponse(copedMiddlewares, req, res);
      res.response.close();

    }
  }

  runMiddlewaresWithRequestResponse (List middlewares, DartServerRequest req, DartServerResponse res) async {
    if (middlewares.length > 0) {
      var middleware = middlewares.removeAt(0);
      await middleware(req: req, res: res, next: () {
        runMiddlewaresWithRequestResponse(middlewares, req, res);
      });
    }
  }
}
