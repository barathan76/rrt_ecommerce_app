import 'dart:convert';

import 'package:api_repository/src/exception/api_error.dart';
import 'package:api_repository/src/path.dart';
import 'package:api_repository/src/usecase/api_products.dart';
import 'package:http/http.dart' as http;
import 'package:storage_repository/storage_repository.dart';

class ApiProductsService implements ApiProducts {
  StorageRepo storageRepo = StorageRepoService();
  @override
  Future<String> filterProducts() {
    throw UnimplementedError();
  }

  @override
  Future<List> getProducts() async {
    try {
      String? token = await storageRepo.getToken();
      print(token);
      final response = await http.get(
        getProductsUrl,
        headers: {'Authorization': '$token'},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ApiError(message: 'Failed to load products');
      }
    } catch (e) {
      print(e);
      throw ApiError(message: 'Failed to load products');
    }
  }
}
