import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/app_bar_cs.dart';

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCS(title: 'Coupons'),
      body: Center(child: Text("No Coupons available")),
    );
  }
}
