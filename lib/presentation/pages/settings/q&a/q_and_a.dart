import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';

class QAndA extends StatelessWidget {
  const QAndA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Questions & Answers",
          style: mtextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: kRedColor,
          ),
        ),
      ),
      body: Center(child: Text("Soon be available")),
    );
  }
}
