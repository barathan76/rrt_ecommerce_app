import 'dart:convert';

import 'package:api_repository/src/entity/response_entity.dart';
import 'package:api_repository/src/path.dart';
import 'package:api_repository/src/usecase/api_auth.dart';
import 'package:http/http.dart' as http;

class ApiAuthService implements ApiAuth {
  @override
  Future<ResponseEntity> loginService(
    String email,
    String password,
    String deviceId,
  ) async {
    final response = await http.post(
      loginUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'deviceId': deviceId,
      }),
    );
    return ResponseEntity.fromResponse(response);
  }

  @override
  Future<ResponseEntity> registerService(
    String email,
    String password,
    String deviceId,
  ) async {
    final response = await http.post(
      registerUrl,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'deviceId': deviceId,
      }),
    );
    return ResponseEntity.fromResponse(response);
  }

  @override
  Future<ResponseEntity> logoutService(String token) async {
    final response = await http.post(
      logoutUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
    );
    return ResponseEntity.fromResponse(response);
  }
}
