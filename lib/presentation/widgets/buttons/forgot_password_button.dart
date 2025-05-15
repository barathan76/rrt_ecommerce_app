import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(
          Colors.transparent,
        ), // Removes grey overlay
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) {
            return authButtonColor;
          }
          return authButtonColor.withValues(alpha: 0.7);
        }),
        textStyle: WidgetStateProperty.all(
          GoogleFonts.montserrat(fontSize: 10),
        ),
      ),
      child: Text('Forgot Password?'),
    );
  }
}
