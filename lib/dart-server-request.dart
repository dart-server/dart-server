import 'dart:io';
import 'dart:mirrors';
import 'package:body_parser/body_parser.dart';
class DartServerRequest {
  HttpRequest request;
  Map query = {};
  Map body = {};
  Map params = {};

  final InstanceMirror _mirror;
  DartServerRequest(this.request): this._mirror = reflect(request);
  noSuchMethod(Invocation invocation) {
    print(invocation.memberName);
    return _mirror.invoke(invocation.memberName, invocation.positionalArguments, invocation.namedArguments).reflectee;
  }

  HttpHeaders get headers => this.request.headers;

  void parseDataAsync () async {
    this.query = request.uri.queryParameters ?? {};
    if (request.method != 'GET'){
      var result = await parseBody(request);
      this.body = result.body ?? {};
    }
    this.params = {...this.query, ...this.body};
  }
}