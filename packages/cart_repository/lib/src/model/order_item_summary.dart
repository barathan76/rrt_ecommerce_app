import 'package:cart_repository/src/model/order_status.dart';
import 'package:intl/intl.dart';

class OrderItemSummary {
  final String productName;
  final String productImg;
  final double price;
  final int quantity;
  final String category;
  final OrderStatus currentStatus;
  final Map<OrderStatus, DateTime> statusTimeStamps;
  OrderItemSummary({
    required this.productImg,
    required this.productName,
    required this.price,
    required this.category,
    required this.currentStatus,
    required this.quantity,
    required this.statusTimeStamps,
  });

  factory OrderItemSummary.fromMap(Map<String, dynamic> map) {
    print('in OrderItem summary conversion $map');
    return OrderItemSummary(
      productImg: map['productImg'],
      productName: map['productName'],
      category: map['category'],
      price: map['price'],
      currentStatus: parseOrderStatus(map['currentStatus']),
      quantity: map['quantity'],
      statusTimeStamps: (map['statusTimeStamps'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(parseOrderStatus(key), DateTime.parse(value)),
      ),
    );
  }
  String getStatusMessage() {
    DateTime? timeStamp = statusTimeStamps[currentStatus];
    if (timeStamp == null) return 'Status date unknown';
    String date = DateFormat('dd/MM/yyyy').format(timeStamp);
    return '${getOrderStatus(currentStatus)} on $date';
  }
}
