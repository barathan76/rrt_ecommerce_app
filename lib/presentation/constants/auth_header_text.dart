import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';

class AuthHeaderText extends StatelessWidget {
  const AuthHeaderText({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: mtextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        children: [TextSpan(text: '$text1 \n'), TextSpan(text: text2)],
      ),
    );
  }
}
