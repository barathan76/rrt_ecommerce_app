import 'package:flutter/material.dart';
import 'package:rrt_ecommerce_app/data/order_model.dart';
import 'package:rrt_ecommerce_app/presentation/constants/constants.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Order Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              Text(
                'Order id : ${order.id}',
                style: mtextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(155, 0, 0, 0),
                ),
              ),
              ...order.cartItems.map(
                (x) => kOutlineContainer(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    spacing: 10,
                    children: [
                      Image.network(
                        x.product.imageUrl,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              x.product.title,
                              maxLines: 2,
                              style: mtextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              x.product.category,
                              maxLines: 2,
                              style: mtextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '${order.amount}',
                              maxLines: 2,
                              style: mtextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              order.getstatusMessage(x.product.id),
                              style: mtextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            OrderProgressIndicator(
                              statusMap: order.statusMap[x.product.id]!,
                              currentStatus:
                                  order.currentStatusMap[x.product.id]!,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              kOutlineContainer(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),

                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Shipping Details\n',
                        style: mtextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            '${order.address.name}\n${order.address.addressLine1}\n${order.address.addressLine2}\n${order.address.city}\n${order.address.state} - ${order.address.pincode}\nPhone number : ${order.address.number}',
                        style: mtextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderProgressIndicator extends StatelessWidget {
  final Map<OrderStatus, DateTime> statusMap;
  final OrderStatus currentStatus;

  OrderProgressIndicator({
    super.key,
    required this.statusMap,
    required this.currentStatus,
  });

  final List<OrderStatus> steps = [
    OrderStatus.confirmed,
    OrderStatus.shipped,
    OrderStatus.outForDelivery,
    OrderStatus.deliverd,
  ];

  int getCurrentStep() {
    if (currentStatus == OrderStatus.cancelled) return -1;
    return steps.indexOf(currentStatus);
  }

  @override
  Widget build(BuildContext context) {
    int currentStep = getCurrentStep();

    if (currentStep == -1) {
      return Row(
        children: [
          Icon(Icons.cancel, color: Colors.red),
          SizedBox(width: 8),
          Text(
            'Order Cancelled',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          if (statusMap[OrderStatus.cancelled] != null)
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                formatedDate(statusMap[OrderStatus.cancelled]!),
                style: TextStyle(color: Colors.grey),
              ),
            ),
        ],
      );
    }

    return Row(
      children:
          steps.asMap().entries.map((entry) {
            int index = entry.key;
            OrderStatus step = entry.value;
            bool isCompleted = index <= currentStep;
            bool isCurrent = index == currentStep;

            return Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Connecting line
                  if (index != -1)
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 14,
                      child: Container(
                        height: 2,
                        color:
                            index <= currentStep
                                ? Colors.greenAccent
                                : Colors.grey[300],
                      ),
                    ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 14,
                        backgroundColor:
                            isCompleted ? Colors.green : Colors.grey,
                        child: Icon(
                          isCompleted ? Icons.check : Icons.circle,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        getOrderStatus(step),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight:
                              isCurrent ? FontWeight.bold : FontWeight.normal,
                          color: isCompleted ? Colors.black : Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      statusMap[step] != null
                          ? Text(
                            formatedDate(statusMap[step]!),
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          )
                          : Text(
                            '',
                            style: TextStyle(fontSize: 10, color: Colors.grey),
                          ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
