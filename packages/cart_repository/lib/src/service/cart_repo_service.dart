import 'package:api_repository/api_repository.dart';
import 'package:cart_repository/cart_repository.dart';

class CartRepoService implements CartRepo {
  ApiCart apiCart = ApiCartService();
  @override
  Future<CartItem> addCartItem(int productId, int quantity) async {
    final x = await apiCart.addCartItem(productId, quantity);
    return CartItem.fromMap(x);
  }

  @override
  Future<List<CartItem>> getCartItems() async {
    List list = await apiCart.getCartItems();
    print(list);
    return list.map((x) => CartItem.fromMap(x)).toList();
  }

  @override
  Future<bool> removeCartItem(int productId) async {
    return await apiCart.deleteCartItem(productId);
  }

  @override
  Future<CartItem> updateCartItem(int productId, int quantity) async {
    final x = await apiCart.updateCartItem(productId, quantity);
    return CartItem.fromMap(x);
  }
}
