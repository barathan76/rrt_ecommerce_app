import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:rrt_ecommerce_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/constants/urls.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/uo_text_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/auth_text_field.dart';
import 'package:rrt_ecommerce_app/services/bloc_initializer.dart';
import 'package:rrt_ecommerce_app/services/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isloading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        AuthRegisterRequestEvent(
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
  }

  void onRegister(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          registerUrl,
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
          } else if (response.statusCode == 409) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(response.body)));
          } else {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Auth failed')));
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
      listener: (BuildContext context, AuthState state) {
        if (state is AuthLoading) {
          setState(() {
            isloading = true;
          });
        } else if (state is AuthAuthenticated) {
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: SizedBox(
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: authHeaderText(
                          text1: 'Create an',
                          text2: 'account',
                        ),
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
                      SizedBox(height: 20),
                      AuthTextField(
                        hintText: 'ConfirmPassword',
                        prefixIcon: Icons.lock,
                        obscure: true,
                        controller: confirmPasswordController,
                        validator:
                            (value) => validateConfirmPassword(
                              value,
                              passwordController.text,
                            ),
                      ),
                      SizedBox(height: 10),
                      RichText(
                        text: TextSpan(
                          style: mtextStyle(fontSize: 12, color: Colors.black),
                          children: [
                            TextSpan(text: 'By clicking the '),
                            TextSpan(
                              text: 'Register',
                              style: TextStyle(color: Colors.red),
                            ),
                            TextSpan(
                              text: ' button, you agree\n to the public offer',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: SubmitButton(
                          onPressed: () {
                            onSubmit(context);
                          },
                          text: 'Create Account',
                          isloading: isloading,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I Already Have an Account ',
                            style: mtextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(255, 87, 87, 87),
                            ),
                          ),
                          UOTextButton(
                            text: 'Login',
                            fontSize: 12,
                            onPressed: () {
                              Navigator.of(context).pop();
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
