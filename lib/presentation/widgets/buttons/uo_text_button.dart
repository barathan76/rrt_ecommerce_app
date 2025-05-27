import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class UOTextButton extends StatelessWidget {
  const UOTextButton({
    super.key,
    required this.text,
    required this.fontSize,
    required this.onPressed,
    this.underline = true,
  });
  final String text;
  final double fontSize;
  final bool underline;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.hovered)) {
            return kRedColor;
          }
          return kRedColor.withValues(alpha: 0.7);
        }),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          return mtextStyle().copyWith(
            decoration: underline ? TextDecoration.underline : null,
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            decorationThickness: underline ? 0.5 : null,
          );
        }),
      ),

      child: Text(text),
    );
  }
}
