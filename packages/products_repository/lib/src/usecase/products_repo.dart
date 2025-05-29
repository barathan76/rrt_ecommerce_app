import 'package:products_repository/src/model/product.dart';

abstract class ProductsRepo {
  Future<List<Product>> getProducts();
}
