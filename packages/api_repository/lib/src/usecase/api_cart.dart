abstract class ApiCart {
  Future<List> getCartItems(String token);
  Future<String> setCartItemCount(String token, int id, int count);
  Future<String> removeCartItem(String token, int id);
}
