import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';

class UnderlinedButton extends StatelessWidget {
  const UnderlinedButton({
    super.key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
  });
  final String text;
  final double fontSize;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) {
            return authButtonColor;
          }
          return authButtonColor.withValues(alpha: 0.7);
        }),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          return GoogleFonts.montserrat(
            decoration: TextDecoration.underline,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            decorationThickness: 0.5,
          );
        }),
      ),

      child: Text(text),
    );
  }
}
