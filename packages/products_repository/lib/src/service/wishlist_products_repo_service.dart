import 'package:api_repository/api_repository.dart';
import 'package:products_repository/products_repository.dart';

class WishlistProductsRepoService extends WishlistProductsRepo {
  ApiWishlist apiWishlist = ApiWishlistService();
  @override
  Future<List<Product>> getWishList() async {
    final response = await apiWishlist.getWishList();
    return response.map((x) => Product.fromMap(x)).toList();
  }

  @override
  Future<bool> isWishlisted(int productId) async {
    return await apiWishlist.isWishlisted(productId);
  }

  @override
  Future<bool> toggleWishlist(int productId) async {
    final x = await apiWishlist.toggleWishlist(productId);
    return x;
  }
}
