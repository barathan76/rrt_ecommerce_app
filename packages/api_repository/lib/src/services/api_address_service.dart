import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/utility/path.dart';
import 'package:api_repository/src/utility/storage_repo_service.dart';
import 'package:http/http.dart' as http;

class ApiAddressService implements ApiAddress {
  @override
  Future<void> addAddress(Map<String, dynamic> address) async {
    String? token = await userToken;
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
    String? token = await userToken;
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
    String? token = await userToken;
    final response = await http.get(
      addressUrl,
      headers: {'Authorization': '$token', 'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      print(response.body);
      return json.decode(response.body);
    } else {
      throw ApiError(message: 'Failed to load addresses');
    }
  }

  @override
  Future<void> updateAddress(int id, Map<String, dynamic> address) async {
    String? token = await userToken;
    final response = await http.put(
      addressUrlId(id),
      headers: {'Authorization': '$token', 'Content-Type': 'application/json'},
      body: json.encode(address),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update address');
    }
  }

  @override
  Future getSelectedAddress() async {
    String? token = await userToken;
    final x = await http.get(
      getSelectedAddressUrl,
      headers: {'Authorization': '$token'},
    );
    if (x.statusCode == 200) {
      return json.decode(x.body);
    }
    throw ApiError(message: 'Unable to connect');
  }

  @override
  Future<void> selectAddress(int addressId) async {
    final x = await http.post(
      selectAddressUrl(addressId),
      headers: {'Authorization': '$token'},
    );
    if (x.statusCode == 200) {
      return;
    }
    throw ApiError(message: 'Unable to connect');
  }
}
