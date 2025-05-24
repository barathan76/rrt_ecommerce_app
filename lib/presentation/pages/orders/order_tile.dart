import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/order_model.dart';
import 'package:rrt_ecommerce_app/presentation/constants/box_shadow.dart';
import 'package:rrt_ecommerce_app/presentation/constants/text_style.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/order_details.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/orders_page.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => OrderDetails(order: order)),
          ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
                boxShadow: [normalBoxShadow()],
              ),
              child: Image.network(
                order.product.imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Column(
                spacing: 5,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    order.product.title,
                    overflow: TextOverflow.ellipsis,
                    style: mtextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    order.statusMessage,

                    style: mtextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 88, 87, 87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
