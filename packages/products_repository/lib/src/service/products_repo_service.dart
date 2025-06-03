import 'package:api_repository/api_repository.dart'
    show ApiError, ApiProducts, ApiProductsService;
import 'package:products_repository/src/exception/load_error.dart';
import 'package:products_repository/src/model/product.dart';
import 'package:products_repository/src/usecase/products_repo.dart';

class ProductsRepoService implements ProductsRepo {
  ApiProducts apiService = ApiProductsService();
  @override
  Future<List<Product>> getProducts() async {
    try {
      final data = await apiService.getProducts();
      return data.map((e) => Product.fromMap(e)).toList();
    } on ApiError catch (e) {
      throw LoadError(message: e.message);
    } catch (_) {
      throw LoadError(message: 'Unable to connect');
    }
  }

  @override
  Future<List<Product>> searchProductsByTitle(String title) async {
    try {
      final data = await apiService.searchProductsByTitle(title);
      return data.map((e) => Product.fromMap(e)).toList();
    } on ApiError catch (e) {
      throw LoadError(message: e.message);
    } catch (e) {
      throw LoadError(message: e.toString());
    }
  }
}
