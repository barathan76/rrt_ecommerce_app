abstract class ApiOrder {
  Future<void> placeOrder(Map<String, dynamic> order);
  Future<List> getUserOrders();
}
