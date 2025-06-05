import 'dart:convert';

import 'package:api_repository/src/exception/api_error.dart';
import 'package:api_repository/src/utility/path.dart';
import 'package:api_repository/src/usecase/api_products.dart';
import 'package:api_repository/src/utility/storage_repo_service.dart';
import 'package:http/http.dart' as http;

class ApiProductsService implements ApiProducts {
  @override
  Future<List> searchProductsByTitle(String title) async {
    String? token = await userToken;
    final response = await http.get(
      searchProducts(title),
      headers: {'Authorization': '$token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ApiError(message: response.statusCode.toString());
    }
  }

  @override
  Future<List> getProducts() async {
    try {
      String? token = await storageRepo.getToken();
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
