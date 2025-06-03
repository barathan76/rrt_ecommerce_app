import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/address_bloc/address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/user_profile_bloc/user_profile_bloc.dart';

void blocInitializer(BuildContext context) {
  BlocProvider.of<CartBloc>(context).add(LoadCartEvent());
  BlocProvider.of<UserProfileBloc>(context).add(LoadUserProfileEvent());
  BlocProvider.of<AddressBloc>(context).add(LoadAddressEvent());
}
