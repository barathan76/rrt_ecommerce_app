import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isloading = false,
  });
  final void Function() onPressed;
  final String text;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return isloading
        ? CircularProgressIndicator()
        : ElevatedButton(
          onPressed: () => isloading == false ? onPressed() : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: kRedColor,
            padding: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: mtextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
  }
}
