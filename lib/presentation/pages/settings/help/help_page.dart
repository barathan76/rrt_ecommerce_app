import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_app_bar.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrdersAppBar(title: 'Help'),
      body: Center(child: Text("Available soon")),
    );
  }
}
