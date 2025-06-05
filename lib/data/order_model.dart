import 'package:cart_repository/cart_repository.dart';
import 'package:intl/intl.dart';
import 'package:user_repository/user_repository.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

Map<int, Map<OrderStatus, DateTime>> initStatusMap(List<CartItem> cartItems) {
  Map<int, Map<OrderStatus, DateTime>> map = {};
  for (CartItem item in cartItems) {
    map[item.product.id] = {OrderStatus.confirmed: DateTime.now()};
  }
  return map;
}

Map<int, OrderStatus> initCurrentStatus(List<CartItem> cartItems) {
  Map<int, OrderStatus> map = {};
  for (CartItem item in cartItems) {
    map[item.product.id] = OrderStatus.confirmed;
  }
  return map;
}

class Order {
  final String id;
  final List<CartItem> cartItems;
  final Map<int, Map<OrderStatus, DateTime>> statusMap;
  final Map<int, OrderStatus> currentStatusMap;
  final double amount;
  final UserAddress address;

  Order({
    required this.amount,
    required this.statusMap,
    required this.address,
    required this.currentStatusMap,
    required this.cartItems,
  }) : id = uuid.v4();

  String getstatusMessage(int id) {
    OrderStatus currentStatus = currentStatusMap[id]!;
    if (currentStatus == OrderStatus.confirmed) {
      return 'Order confirmed on ${statusMap[id]![OrderStatus.confirmed] != null ? (formatedDate(statusMap[id]![OrderStatus.confirmed]!)) : 'NaN'}';
    } else if (currentStatus == OrderStatus.shipped) {
      return 'Order shipped on ${statusMap[id]![OrderStatus.shipped] != null ? formatedDate(statusMap[id]![OrderStatus.shipped]!) : 'NaN'}';
    } else if (currentStatus == OrderStatus.outForDelivery) {
      return 'Order out for delivery on ${statusMap[id]![OrderStatus.shipped] != null ? formatedDate(statusMap[id]![OrderStatus.outForDelivery]!) : 'NaN'}';
    } else if (currentStatus == OrderStatus.deliverd) {
      return 'Order delivered on ${statusMap[id]![OrderStatus.deliverd] != null ? formatedDate(statusMap[id]![OrderStatus.deliverd]!) : 'NaN'}';
    }

    return 'Order details unavailable';
  }

  void statusUpdate(OrderStatus status, int id) {
    statusMap[id]?[status] = DateTime.now();
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
