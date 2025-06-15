part of 'wishlist_products_bloc.dart';

sealed class WishlistProductsEvent {}

class LoadWishlistProducts extends WishlistProductsEvent {}

class ToggleWishlistProduct extends WishlistProductsEvent {
  final int productId;
  ToggleWishlistProduct(this.productId);
}

class AddWishlistProduct extends WishlistProductsEvent {
  final int productId;
  AddWishlistProduct(this.productId);
}
