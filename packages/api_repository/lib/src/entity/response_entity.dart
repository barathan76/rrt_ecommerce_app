import 'package:http/http.dart';

class ResponseEntity {
  int statusCode;
  String body;
  ResponseEntity({required this.statusCode, required this.body});
  factory ResponseEntity.fromResponse(Response response) {
    return ResponseEntity(statusCode: response.statusCode, body: response.body);
  }
}
