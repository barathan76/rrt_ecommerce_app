import 'package:cart_repository/src/model/order_item_summary.dart';
import 'package:user_repository/user_repository.dart';

class Order {
  final int orderId;
  final double amount;
  final UserAddress address;
  final List<OrderItemSummary> orderItems;
  Order({
    required this.orderId,
    required this.amount,
    required this.address,
    required this.orderItems,
  });
  factory Order.fromMap(Map<String, dynamic> map) {
    print('in Order conversion $map');
    return Order(
      orderId: map['orderId'],
      amount: map['amount'],
      address: UserAddress.fromMap(map['address']),
      orderItems:
          (map['item'] as List)
              .map((x) => OrderItemSummary.fromMap(x))
              .toList(),
    );
  }
}
