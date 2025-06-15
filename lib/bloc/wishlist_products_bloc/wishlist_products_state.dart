part of 'wishlist_products_bloc.dart';

sealed class WishlistProductsState {
  final List<Product> wishlistedProducts;
  WishlistProductsState(this.wishlistedProducts);
}

class WishlistProductsInitial extends WishlistProductsState {
  WishlistProductsInitial() : super([]);
}

class WishlistProductsLoaded extends WishlistProductsState {
  WishlistProductsLoaded(super.wishlistedProducts);
}

class WishlistProductsFailure extends WishlistProductsState {
  final String msg;
  WishlistProductsFailure(super.wishlistedProducts, {required this.msg});
}

class WishlistProductsLoading extends WishlistProductsState {
  WishlistProductsLoading() : super([]);
}

class WishlistProductsUpdated extends WishlistProductsState {
  WishlistProductsUpdated(super.wishlistedProducts);
}
