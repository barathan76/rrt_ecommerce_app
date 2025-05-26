import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_app_bar.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OrdersAppBar(title: 'Coupons'),
      body: Center(child: Text("No Coupons available")),
    );
  }
}
