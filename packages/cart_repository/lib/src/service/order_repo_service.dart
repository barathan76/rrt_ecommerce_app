import 'package:api_repository/api_repository.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:cart_repository/src/model/cart_item_request.dart';
import 'package:user_repository/user_repository.dart' show UserAddress;

class OrderRepoService extends OrderRepo {
  ApiOrder apiOrder = ApiOrderService();
  @override
  Future<List<Order>> getUserOrders() async {
    try {
      final x = await apiOrder.getUserOrders();
      print(x);
      return x.map((y) => Order.fromMap(y)).toList();
    } on ApiError catch (e) {
      throw CartError(e.message);
    }
  }

  @override
  Future<void> placeOrder(List<CartItem> cartItems, UserAddress address) async {
    try {
      List<CartItemRequest> items =
          cartItems
              .map(
                (e) => CartItemRequest(
                  productId: e.product.id,
                  quantity: e.quantity,
                ),
              )
              .toList();
      OrderRequest orderRequest = OrderRequest(items: items, address: address);
      await apiOrder.placeOrder(orderRequest.toMap());
    } on ApiError catch (e) {
      throw CartError(e.message);
    }
  }
}
