class CartItemRequest {
  final int productId;
  final int quantity;
  CartItemRequest({required this.productId, required this.quantity});

  Map<String, dynamic> toMap() {
    return {'productId': productId, 'quantity': quantity};
  }
}
