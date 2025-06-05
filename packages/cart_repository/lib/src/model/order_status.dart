enum OrderStatus { confirmed, shipped, outForDelivery, deliverd, cancelled }

OrderStatus parseOrderStatus(String status) {
  return OrderStatus.values.firstWhere(
    (e) => e.name.toLowerCase() == status.toLowerCase(),
    orElse: () => OrderStatus.confirmed,
  );
}

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
