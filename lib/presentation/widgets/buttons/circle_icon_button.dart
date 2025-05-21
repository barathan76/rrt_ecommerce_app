import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({
    super.key,
    required this.icon,
    required this.size,
    required this.color,
    required this.onPressed,
    this.isdisabled,
  });
  final IconData icon;
  final double size;
  final Color color;
  final void Function() onPressed;
  final bool? isdisabled;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: isdisabled == null || isdisabled == false ? 1.0 : 0.4,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // Light background
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: isdisabled == null || isdisabled == false ? onPressed : null,
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(icon, size: size, color: color),
          ),
        ),
      ),
    );
  }
}
