import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/address_bloc/address_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/cart_bloc/cart_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/products_bloc/products_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/search_products_bloc/search_products_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/user_profile_bloc/user_profile_bloc.dart';
import 'package:rrt_ecommerce_app/starters/main_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => AuthBloc()..add(AuthCheckAuthStatusEvent()),
        ),
        BlocProvider(create: (ctx) => ProductsBloc()),
        BlocProvider(create: (ctx) => UserProfileBloc()),
        BlocProvider(create: (ctx) => AddressBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => SearchProductsBloc()),
      ],
      child: MainApp(),
    );
  }
}
