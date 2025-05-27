import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/order_model.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/my_orders/order_details.dart';

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
      child: kOutlineNSContainer(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(8),
        child: Row(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            kOutlineContainer(
              width: 80,
              height: 80,
              child: Image.network(
                order.cartItems[0].product.imageUrl,
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
                    '${order.cartItems[0].product.title} ${order.cartItems.length > 1 ? '+ ${order.cartItems.length - 1} items' : ''}',
                    overflow: TextOverflow.ellipsis,
                    style: mtextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    order.getstatusMessage(order.cartItems[0].product.id),
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
