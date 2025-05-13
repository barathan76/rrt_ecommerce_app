import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/auth_header_text.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/login_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/auth_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/auth_text_field.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/underlined_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    AuthTextField(
                      hintText: 'Password',
                      prefixIcon: Icons.lock,
                      obscure: true,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 20),
                    AuthTextField(
                      hintText: 'ConfirmPassword',
                      prefixIcon: Icons.lock,
                      obscure: true,
                      controller: TextEditingController(),
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
                    AuthButton(onPressed: () {}, text: 'Create Account'),
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
