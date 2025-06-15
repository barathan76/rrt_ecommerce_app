import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/utility/path.dart';
import 'package:api_repository/src/utility/storage_repo_service.dart';
import 'package:http/http.dart' as http;

class ApiWishlistService extends ApiWishlist {
  @override
  Future<List> getWishList() async {
    String? token = await userToken;
    final response = await http.get(
      wishlistUrl,
      headers: {'Authorization': '$token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw ApiError(message: 'Failed to fetch');
  }

  @override
  Future<bool> isWishlisted(int productId) async {
    String? token = await userToken;
    final response = await http.get(
      checkWishlistUrl(productId),
      headers: {'Authorization': '$token'},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    }
    throw ApiError(message: 'Failed to fetch');
  }

  @override
  Future<bool> toggleWishlist(int productId) async {
    String? token = await userToken;
    final response = await http.post(
      toogleWishlistUrl(productId),
      headers: {'Authorization': '$token'},
    );
    if (response.statusCode == 200) {
      return true;
    }
    throw ApiError(message: 'Failed to toggle');
  }
}
