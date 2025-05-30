import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/address.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.selectedType,
    required this.buttonType,
    required this.onPressed,
  });
  final String title;
  final IconData icon;
  final AddressType selectedType;
  final AddressType buttonType;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    bool condition = selectedType == buttonType;
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: condition ? Colors.green : Colors.black),
      label: Text(
        title,
        style: TextStyle(color: condition ? Colors.green : Colors.black),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: condition ? Colors.green : Colors.grey,
          width: 1,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }
}
