import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:rrt_ecommerce_app/services/bloc_initializer.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              blocInitializer(context);
              Navigator.pushReplacementNamed(context, '/home');
            });
          } else if (state is AuthUnAuthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pushReplacementNamed(context, '/login');
            });
          }
        },
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
