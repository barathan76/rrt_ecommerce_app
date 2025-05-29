import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.obscure,
    required this.controller,
    required this.validator,
  });
  final String hintText;
  final IconData prefixIcon;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool obscure = false;
  @override
  void initState() {
    super.initState();
    obscure = widget.obscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: widget.controller,
      validator: widget.validator,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.prefixIcon, color: authTextFieldIconColor),
        hintText: widget.hintText,
        hintStyle: mtextStyle(
          color: authTextFieldHintColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon:
            widget.obscure
                ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: authTextFieldIconColor,
                  ),
                )
                : null,

        // fillColor: const Color.fromARGB(255, 243, 243, 243),
        // filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: authTextFieldBorderColor),

          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
