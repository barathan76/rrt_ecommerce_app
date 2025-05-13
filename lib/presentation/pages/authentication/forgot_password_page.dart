import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/auth_header_text.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/login_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/auth_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/auth_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthHeaderText(text1: 'Forgot', text2: 'password?'),

                  SizedBox(height: 30),
                  AuthTextField(
                    hintText: 'Email',
                    prefixIcon: Icons.mail,
                    obscure: false,
                    controller: TextEditingController(),
                  ),
                  SizedBox(height: 10),

                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: '* ',
                          style: TextStyle(color: Colors.red),
                        ),
                        TextSpan(
                          text: 'We will send you a message to set or reset\n',
                        ),
                        TextSpan(text: ' your new password'),
                      ],
                    ),
                  ),

                  SizedBox(height: 30),
                  AuthButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (ctx) => LoginPage()));
                    },
                    text: 'Login',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
