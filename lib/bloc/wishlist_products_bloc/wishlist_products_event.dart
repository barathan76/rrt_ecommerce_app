part of 'wishlist_products_bloc.dart';

sealed class WishlistProductsEvent {}

class LoadWishlistProducts extends WishlistProductsEvent {}

class ToggleWishlistProduct extends WishlistProductsEvent {
  final int productId;
  final Product product;
  ToggleWishlistProduct(this.productId, this.product);
}

class AddWishlistProduct extends WishlistProductsEvent {
  final int productId;
  AddWishlistProduct(this.productId);
}
