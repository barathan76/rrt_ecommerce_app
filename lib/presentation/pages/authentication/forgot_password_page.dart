import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/auth_functions.dart';
import 'package:rrt_ecommerce_app/presentation/pages/authentication/login_page.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/buttons/submit_button.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/auth_text_field.dart';

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
                  authHeaderText(text1: 'Forgot', text2: 'password?'),

                  SizedBox(height: 30),
                  AuthTextField(
                    hintText: 'Email',
                    prefixIcon: Icons.mail,
                    obscure: false,
                    controller: TextEditingController(),
                    validator: validateEmail,
                  ),
                  SizedBox(height: 10),

                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: mtextStyle(fontSize: 12, color: Colors.black),
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
                  SubmitButton(
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
