import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/color_scheme.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/orders_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_details.dart';
import 'package:rrt_ecommerce_app/presentation/pages/settings/addreess/address_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MainApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.trackpad,
          PointerDeviceKind.stylus,
        },
      ),

      theme: ThemeData(colorScheme: kColorScheme),
      home: OrdersPage(),
    );
  }
}
