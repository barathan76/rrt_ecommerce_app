part of 'wishlist_bloc.dart';

sealed class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class ProductWishlisted extends WishlistState {}

class ProductNotWishlisted extends WishlistState {}
