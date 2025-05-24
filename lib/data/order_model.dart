import 'package:rrt_ecommerce_app/data/product_model.dart';
import 'package:intl/intl.dart';

class Order {
  final String id;
  final Product product;
  OrderStatus currentStatus;
  final Map<OrderStatus, DateTime> statusMap;
  final int quantity;
  final double amount;
  Order({
    required this.id,
    required this.product,
    required this.quantity,
    required this.amount,
  }) : currentStatus = OrderStatus.confirmed,
       statusMap = {OrderStatus.confirmed: DateTime.now()};

  String get statusMessage {
    if (currentStatus == OrderStatus.confirmed) {
      return 'Order confirmed on ${statusMap[OrderStatus.confirmed] != null ? (formatedDate(statusMap[OrderStatus.confirmed]!)) : 'NaN'}';
    } else if (currentStatus == OrderStatus.shipped) {
      return 'Order shipped on ${statusMap[OrderStatus.shipped] != null ? formatedDate(statusMap[OrderStatus.shipped]!) : 'NaN'}';
    } else if (currentStatus == OrderStatus.outForDelivery) {
      return 'Order out for delivery on ${statusMap[OrderStatus.shipped] != null ? formatedDate(statusMap[OrderStatus.outForDelivery]!) : 'NaN'}';
    } else if (currentStatus == OrderStatus.deliverd) {
      return 'Order delivered on ${statusMap[OrderStatus.deliverd] != null ? formatedDate(statusMap[OrderStatus.deliverd]!) : 'NaN'}';
    }

    return 'Order details unavailable';
  }

  void statusUpdate(OrderStatus status) {
    currentStatus = status;
    statusMap[status] = DateTime.now();
  }
}

String formatedDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}

enum OrderStatus { confirmed, shipped, outForDelivery, deliverd, cancelled }

String getOrderStatus(OrderStatus currentStatus) {
  if (currentStatus == OrderStatus.confirmed) {
    return 'Confirmed';
  } else if (currentStatus == OrderStatus.shipped) {
    return 'Shipped';
  } else if (currentStatus == OrderStatus.outForDelivery) {
    return 'Out for delivery';
  } else if (currentStatus == OrderStatus.deliverd) {
    return 'Delivered';
  }

  return 'Cancelled';
}
