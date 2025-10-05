import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/address_bloc/address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/order_bloc/order_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/products_bloc/products_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/select_address_bloc/select_address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/wishlist_products_bloc/wishlist_products_bloc.dart';

void blocInitializer(BuildContext context) {
  BlocProvider.of<ProductsBloc>(context).add(GetProductsEvent());
  BlocProvider.of<CartBloc>(context).add(LoadCartEvent());
  BlocProvider.of<UserProfileBloc>(context).add(LoadUserProfileEvent());
  BlocProvider.of<AddressBloc>(context).add(LoadAddressEvent());
  BlocProvider.of<OrderBloc>(context).add(LoadOrdersEvent());
  BlocProvider.of<WishlistProductsBloc>(context).add(LoadWishlistProducts());
  BlocProvider.of<SelectAddressBloc>(context).add(InitSelectAddressEvent());
}
