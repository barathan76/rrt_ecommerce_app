import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/colors.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';

class SavedCardsPage extends StatelessWidget {
  const SavedCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Saved Card",
          style: mtextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: authButtonColor,
          ),
        ),
      ),
      body: Center(child: Text("No cards available")),
    );
  }
}
