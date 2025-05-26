import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Reviews",
          style: mtextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: authButtonColor,
          ),
        ),
      ),
      body: Center(child: Text("Soon be available")),
    );
  }
}
