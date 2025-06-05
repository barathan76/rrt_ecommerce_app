part of 'wishlist_bloc.dart';

sealed class WishlistEvent {}

class CheckWishListed extends WishlistEvent {
  final int productId;
  CheckWishListed(this.productId);
}
