import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/path.dart';
import 'package:api_repository/src/usecase/api_cart.dart';
import 'package:http/http.dart' as http;

class ApiCartService implements ApiCart {
  @override
  Future<List> getCartItems(String token) async {
    final response = await http.get(
      getCartUrl,
      headers: {"Authorization": token},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw ApiError(message: 'Failed to load cart');
  }

  @override
  Future<String> removeCartItem(String token, int id) async {
    final response = await http.delete(
      removeCartItemUrl,
      headers: {"Authorization": token, "id": '$id'},
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiError(message: 'Failed to remove item');
  }

  @override
  Future<String> setCartItemCount(String token, int id, int count) async {
    final response = await http.put(
      setCartItemCountUrl,
      headers: {"Authorization": token, "id": '$id'},
      body: count,
    );
    if (response.statusCode == 200) {
      return response.body;
    }
    throw ApiError(message: 'Failed to update item');
  }
}
