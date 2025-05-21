import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeaderText extends StatelessWidget {
  const AuthHeaderText({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 36,
          color: Colors.black,
        ),
        children: [TextSpan(text: '$text1 \n'), TextSpan(text: text2)],
      ),
    );
  }
}
