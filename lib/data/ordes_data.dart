import 'package:rrt_ecommerce_app/data/order_model.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';

List<Order> ordersList = [
  Order(
    id: '1',
    product: productsData[0],
    quantity: 1,
    amount: productsData[0].price * 1,
  )..statusUpdate(OrderStatus.shipped),
];
