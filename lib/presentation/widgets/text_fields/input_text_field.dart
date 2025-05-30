import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({
    super.key,
    required this.obscure,
    required this.title,
    required this.controller,
    required this.hint,
    this.regExp,
  });
  final String title;
  final TextEditingController controller;
  final bool obscure;
  final String hint;
  final RegExp? regExp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: mtextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            obscureText: obscure,
            controller: controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Provide details';
              } else if (regExp != null && !regExp!.hasMatch(value)) {
                return 'type valid details';
              }
            },
            style: mtextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              hintText: hint,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 200, 200, 200),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
