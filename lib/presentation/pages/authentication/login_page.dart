import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rrt_ecommerce_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/constants/urls.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/uo_text_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/auth_text_field.dart';
import 'package:rrt_ecommerce_app/services/bloc_initializer.dart';
import 'package:rrt_ecommerce_app/services/validators.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        AuthLoginRequestEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  void onLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          loginUrl,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            'email': emailController.text,
            'password': passwordController.text,
          }),
        );

        if (context.mounted) {
          if (response.statusCode == 200) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => HomePage()));
          } else if (response.statusCode == 401) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(response.body)));
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Login failed')));
          }
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Unable to connect at this moment')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isloading = true;
          });
        } else if (state is AuthAuthenticated) {
          setState(() {
            isloading = false;
          });
          blocInitializer(context);
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is AuthFailure) {
          setState(() {
            isloading = false;
          });
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.body)));
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: authHeaderText(text1: 'Welcome', text2: 'Back!'),
                      ),
                      SizedBox(height: 30),
                      AuthTextField(
                        hintText: 'Email',
                        prefixIcon: Icons.person,
                        obscure: false,
                        controller: emailController,
                        validator: validateEmail,
                      ),
                      SizedBox(height: 20),
                      AuthTextField(
                        hintText: 'Password',
                        prefixIcon: Icons.lock,
                        obscure: true,
                        controller: passwordController,
                        validator: validatePassword,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: UOTextButton(
                          fontSize: 10,
                          onPressed: () {
                            Navigator.pushNamed(context, '/forgot');
                          },
                          text: 'Forgot Password',
                          underline: false,
                        ),
                      ),

                      SizedBox(height: 30),
                      SubmitButton(
                        onPressed: () {
                          onSubmit(context);
                        },
                        text: 'Login',
                        isloading: isloading,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Create an Account',
                            style: mtextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 87, 87, 87),
                            ),
                          ),
                          UOTextButton(
                            text: 'Sign Up',
                            fontSize: 12,
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
