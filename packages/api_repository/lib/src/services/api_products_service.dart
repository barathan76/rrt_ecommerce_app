import 'dart:convert';

import 'package:api_repository/src/exception/api_error.dart';
import 'package:api_repository/src/path.dart';
import 'package:api_repository/src/usecase/api_products.dart';
import 'package:http/http.dart' as http;

class ApiProductsService implements ApiProducts {
  @override
  Future<String> filterProducts() {
    throw UnimplementedError();
  }

  @override
  Future<List> getProducts() async {
    final response = await http.get(getProductsUrl);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw ApiError(message: 'Failed to load products');
    }
  }
}
