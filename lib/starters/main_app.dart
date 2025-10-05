import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/main_scaffold.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/forgot_password_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/login_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/register_page.dart';
import 'package:rrt_ecommerce_app/starters/splash.dart';

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

      initialRoute: '/',
      routes: {
        '/': (_) => Splash(),
        '/login': (_) => LoginPage(),
        '/register': (_) => RegisterPage(),
        '/forgot': (_) => ForgotPasswordPage(),
        '/home': (_) => MainScaffold(),
      },
      theme: ThemeData(colorScheme: kColorScheme),
      // home: ProfilePage(),
    );
  }
}
