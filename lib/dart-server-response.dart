import 'dart:io';
import 'dart:convert';
import 'dart:mirrors';

class DartServerResponse {
  var response;

  final InstanceMirror _mirror;
  DartServerResponse(this.response): this._mirror = reflect(response);
  noSuchMethod(Invocation invocation) {
    print(invocation.memberName);
    return _mirror.invoke(invocation.memberName, invocation.positionalArguments, invocation.namedArguments).reflectee;
  }
  HttpHeaders get headers => this.response.headers;

  void set body(value) {
    if (value is Map) {
      this.response.write(jsonEncode(value));
    }
  }
}
