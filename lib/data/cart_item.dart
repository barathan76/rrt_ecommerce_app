import 'package:products_repository/products_repository.dart' show Product;

class CartItem {
  CartItem({required this.product, required this.count});
  final Product product;
  int count;
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (other is Product) {
      return other.id == product.id;
    }
    return super == other;
  }
}
