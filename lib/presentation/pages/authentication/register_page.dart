import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/auth_header_text.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/auth_functions.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/login_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/auth_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/auth_text_field.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/underlined_button.dart';

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
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void onLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('http://10.30.154.125:8080/api/auth/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            'email': emailController.text,
            'password': passwordController.text,
          }),
        );
        if (response.statusCode == 200) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (ctx) => HomePage()));
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Auth failed')));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Unable to connect at this moment')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: AuthHeaderText(
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
                        style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: Colors.black,
                        ),
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
                    AuthButton(
                      onPressed: () {
                        onLogin(context);
                      },
                      text: 'Create Account',
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'I Already Have an Account ',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 87, 87, 87),
                          ),
                        ),
                        UnderlinedButton(
                          text: 'Login',
                          fontSize: 12,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
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
    );
  }
}
