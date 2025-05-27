import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class RatingCount extends StatelessWidget {
  const RatingCount({super.key, required this.count, required this.fontSize});

  final double count;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        '$count',
        style: mtextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: Color.fromARGB(255, 164, 169, 179),
        ),
      ),
    );
  }
}
