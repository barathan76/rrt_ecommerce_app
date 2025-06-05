import 'package:cart_repository/cart_repository.dart' show CartItem, Order;
import 'package:user_repository/user_repository.dart';

abstract class OrderRepo {
  Future<List<Order>> getUserOrders();
  Future<void> placeOrder(List<CartItem> cartItems, UserAddress address);
}
