import 'package:cart_repository/cart_repository.dart' show CartItem;
import 'package:cart_repository/src/model/cart_item_request.dart';
import 'package:user_repository/user_repository.dart';

class OrderRequest {
  final List<CartItemRequest> items;
  final UserAddress address;
  OrderRequest({required this.items, required this.address});

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
      'address': address.toMap(),
    };
  }

  factory OrderRequest.getRequest(
    List<CartItem> cartItems,
    UserAddress address,
  ) {
    List<CartItemRequest> requestItems =
        cartItems
            .map((x) => CartItemRequest(productId: x.id, quantity: x.quantity))
            .toList();
    return OrderRequest(items: requestItems, address: address);
  }
}
