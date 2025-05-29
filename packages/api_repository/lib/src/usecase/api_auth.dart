import 'package:api_repository/src/entity/response_entity.dart';

abstract class ApiAuth {
  Future<ResponseEntity> loginService(String email, String password);
  Future<ResponseEntity> registerService(String email, String password);
}
