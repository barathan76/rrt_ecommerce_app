import 'package:cart_repository/src/model/cart_item.dart';

abstract class CartRepo {
  Future<List<CartItem>> getCartItems();
  Future<bool> updateCartItem(int index);
  Future<bool> removeCartItem(int index);
}
