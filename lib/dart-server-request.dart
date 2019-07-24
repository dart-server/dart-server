import 'dart:io';
import 'dart:mirrors';
class DartServerRequest {
  var request;

  final InstanceMirror _mirror;
  DartServerRequest(this.request): this._mirror = reflect(request);
  noSuchMethod(Invocation invocation) {
    print(invocation.memberName);
    return _mirror.invoke(invocation.memberName, invocation.positionalArguments, invocation.namedArguments).reflectee;
  }
  HttpHeaders get headers => this.request.headers;
}