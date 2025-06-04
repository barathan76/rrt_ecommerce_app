import 'package:products_repository/products_repository.dart' show Product;

class CartItem {
  CartItem({required this.id, required this.product, required this.quantity});
  final int id;
  final Product product;
  final int quantity;

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      quantity: map['quantity'],
      product: Product.fromMap(map['product']),
    );
  }

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    if (other is Product) {
      return other.id == product.id;
    }
    return super == other;
  }
}
