import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/auth_header_text.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/auth_functions.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/forgot_password_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/register_page.dart';
import 'package:rrt_ecommerce_app/presentation/pages/home/home_page.dart';

import 'package:rrt_ecommerce_app/presentation/widgets/buttons/auth_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/auth_text_field.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/forgot_password_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/underlined_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void onLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (ctx) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      child: AuthHeaderText(text1: 'Welcome', text2: 'Back!'),
                    ),
                    SizedBox(height: 30),
                    AuthTextField(
                      hintText: 'Email',
                      prefixIcon: Icons.person,
                      obscure: false,
                      controller: TextEditingController(),
                      validator: validateEmail,
                    ),
                    SizedBox(height: 20),
                    AuthTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscure: true,
                      controller: TextEditingController(),
                      validator: validatePassword,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ForgotPasswordButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 30),
                    AuthButton(
                      onPressed: () {
                        onLogin(context);
                      },
                      text: 'Login',
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Create an Account',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(255, 87, 87, 87),
                          ),
                        ),
                        UnderlinedButton(
                          text: 'Sign Up',
                          fontSize: 12,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
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
