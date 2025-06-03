import 'package:cart_repository/src/model/cart_item.dart';

abstract class CartRepo {
  Future<List<CartItem>> getCartItems();
  Future<CartItem> updateCartItem(int productId, int quantity);
  Future<bool> removeCartItem(int productId);
  Future<CartItem> addCartItem(int productId, int quantity);
}
