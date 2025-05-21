import 'package:rrt_ecommerce_app/data/product_model.dart';

class CartItem {
  CartItem({required this.product, required this.count});
  final Product product;
  int count;
  @override
  bool operator ==(Object other) {
    if (other is Product) {
      return other.id == product.id;
    }
    return super == other;
  }
}
