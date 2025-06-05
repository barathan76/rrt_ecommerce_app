abstract class ApiWishlist {
  Future<bool> isWishlisted(int productId);
  Future<bool> toggleWishlist(int productId);
  Future<List> getWishList();
}
