import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/path.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:http/http.dart' as http;

class ApiUserService implements ApiUser {
  StorageRepo storageRepo = StorageRepoService();
  @override
  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      String? token = await storageRepo.getToken();
      final response = await http.get(
        userProfileUrl,
        headers: {'Authorization': token!},
      );
      return jsonDecode(response.body) as Map<String, dynamic>;
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }

  @override
  Future<void> updateUserProfile(Map<String, dynamic> userProfile) async {
    try {
      String? token = await storageRepo.getToken();
      await http.put(
        userProfileUrl,
        body: jsonEncode(userProfile),
        headers: {"Authorization": token!, "Content-Type": "application/json"},
      );
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
