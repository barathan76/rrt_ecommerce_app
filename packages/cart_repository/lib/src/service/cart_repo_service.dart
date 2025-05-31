import 'package:cart_repository/cart_repository.dart';
import 'package:cart_repository/src/model/cart_item.dart';

class CartRepoService implements CartRepo {
  @override
  Future<List<CartItem>> getCartItems() {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeCartItem(int index) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCartItem(int index) {
    throw UnimplementedError();
  }
}
