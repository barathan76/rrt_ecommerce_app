import 'dart:convert';

import 'package:api_repository/src/exception/api_error.dart';
import 'package:api_repository/src/usecase/api_order.dart';
import 'package:api_repository/src/utility/path.dart';
import 'package:api_repository/src/utility/storage_repo_service.dart';
import 'package:http/http.dart' as http;

class ApiOrderService extends ApiOrder {
  @override
  Future<List> getUserOrders() async {
    String? token = await userToken;
    final response = await http.get(
      getUserOrdersUrl,
      headers: {'Authorization': '$token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw ApiError(message: response.body);
    }
  }

  @override
  Future<void> placeOrder(Map<String, dynamic> order) async {
    String? token = await userToken;
    final response = await http.post(
      placeOrderUrl,
      headers: {'Authorization': '$token', "Content-Type": "application/json"},
      body: jsonEncode(order),
    );
    if (response.statusCode == 200) {
      return;
    }
    throw ApiError(message: response.body);
  }
}
