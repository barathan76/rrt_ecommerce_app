abstract class ApiCart {
  Future<List> getCartItems();
  Future<Map<String, dynamic>> addCartItem(int productId, int quantity);
  Future<Map<String, dynamic>> updateCartItem(int productId, int quantity);
  Future<bool> deleteCartItem(int productId);
  Future<void> clearCart();
}
