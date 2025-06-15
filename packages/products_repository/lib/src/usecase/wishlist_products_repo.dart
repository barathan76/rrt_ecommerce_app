import 'package:products_repository/products_repository.dart' show Product;

abstract class WishlistProductsRepo {
  Future<bool> isWishlisted(int productId);
  Future<bool> toggleWishlist(int productId);
  Future<List<Product>> getWishList();
}
