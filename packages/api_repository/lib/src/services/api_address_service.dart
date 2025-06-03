import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/utility/path.dart';
import 'package:http/http.dart' as http;
import 'package:storage_repository/storage_repository.dart';

class ApiAddressService implements ApiAddress {
  StorageRepo storageRepo = StorageRepoService();
  @override
  Future<void> addAddress(Map<String, dynamic> address) async {
    String? token = await storageRepo.getToken();
    final response = await http.post(
      addressUrl,
      headers: {'Authorization': '$token', 'Content-Type': 'application/json'},
      body: json.encode(address),
    );
    if (response.statusCode != 200) {
      throw ApiError(message: 'Failed to add address');
    }
  }

  @override
  Future<void> deleteAddress(int id) async {
    String? token = await storageRepo.getToken();
    final response = await http.delete(
      addressUrlId(id),
      headers: {'Authorization': '$token'},
    );
    if (response.statusCode != 200) {
      throw ApiError(message: 'Failed to delete address');
    }
  }

  @override
  Future<List> getAddresses() async {
    String? token = await storageRepo.getToken();
    final response = await http.get(
      addressUrl,
      headers: {'Authorization': '$token', 'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ApiError(message: 'Failed to load addresses');
    }
  }

  @override
  Future<void> updateAddress(int id, Map<String, dynamic> address) async {
    String? token = await storageRepo.getToken();
    final response = await http.put(
      addressUrlId(id),
      headers: {'Authorization': '$token', 'Content-Type': 'application/json'},
      body: json.encode(address),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update address');
    }
  }
}
