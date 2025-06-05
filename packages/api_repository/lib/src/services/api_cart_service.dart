import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/utility/path.dart';
import 'package:api_repository/src/utility/storage_repo_service.dart';
import 'package:http/http.dart' as http;

class ApiCartService implements ApiCart {
  @override
  Future<List> getCartItems() async {
    String? token = await userToken;
    final response = await http.get(
      getCartUrl,
      headers: {"Authorization": '$token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw ApiError(message: 'Failed to load cart');
  }

  @override
  Future<bool> deleteCartItem(int productId) async {
    String? token = await userToken;
    print(productId);
    final response = await http.delete(
      removeCartItem(productId),
      headers: {"Authorization": '$token'},
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    }
    throw ApiError(message: 'Failed to remove item');
  }

  @override
  Future<Map<String, dynamic>> updateCartItem(
    int productId,
    int quantity,
  ) async {
    String? token = await userToken;
    print(productId);
    final response = await http.put(
      updateCartItemUrl,
      headers: {"Authorization": '$token', 'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'productId': productId,
        'quantity': quantity,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw ApiError(message: 'Failed to update item');
  }

  @override
  Future<Map<String, dynamic>> addCartItem(int productId, int quantity) async {
    String? token = await userToken;
    final response = await http.post(
      addCartItemUrl,
      headers: {"Authorization": '$token', 'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'productId': productId,
        'quantity': quantity,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw ApiError(message: 'Failed to update item');
  }

  @override
  Future<void> clearCart() async {
    try {
      await http.delete(clearCartUrl, headers: {"Authorization": '$token'});
    } catch (e) {
      throw ApiError(message: e.toString());
    }
  }
}
