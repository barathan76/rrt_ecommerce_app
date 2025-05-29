import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Privacy",
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
