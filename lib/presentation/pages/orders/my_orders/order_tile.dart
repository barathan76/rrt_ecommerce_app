import 'package:cart_repository/cart_repository.dart' show Order;
import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';
import 'package:rrt_ecommerce_app/presentation/pages/orders/my_orders/order_details.dart'
    show OrderDetails;

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
                order.orderItems[0].productImg,
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
                    '${order.orderItems[0].productName} ${order.orderItems.length > 1 ? '+ ${order.orderItems.length - 1} items' : ''}',
                    overflow: TextOverflow.ellipsis,
                    style: mtextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    order.orderItems[0].getStatusMessage(),
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
