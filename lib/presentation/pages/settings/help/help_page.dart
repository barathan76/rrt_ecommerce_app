import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/app_bar_cs.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCS(title: 'Help'),
      body: Center(child: Text("Available soon")),
    );
  }
}
