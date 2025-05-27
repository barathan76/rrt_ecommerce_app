import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/ordes_data.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/appbars/app_bar_cs.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/my_orders/order_tile.dart';
import 'package:rrt_ecommerce_app/presentation/widgets/text_fields/search_bar_field.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCS(title: 'My Orders'),
      body:
          ordersList.isEmpty
              ? Center(child: Text('Nothing here'))
              : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SearchBarField(),
                      ListView.builder(
                        itemCount: ordersList.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:
                            (context, index) =>
                                OrderTile(order: ordersList[index]),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
