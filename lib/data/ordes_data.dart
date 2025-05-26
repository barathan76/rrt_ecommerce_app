import 'package:rrt_ecommerce_app/data/adress_data.dart';
import 'package:rrt_ecommerce_app/data/cart_item.dart';
import 'package:rrt_ecommerce_app/data/order_model.dart';
import 'package:rrt_ecommerce_app/data/products_data.dart';

List<Order> ordersList = [
  Order(
    amount: productsData[0].price * 1,
    address: addressesList[0],
    currentStatusMap: initCurrentStatus(sample),
    statusMap: initStatusMap(sample),
    cartItems: sample,
  )..statusUpdate(OrderStatus.shipped, productsData[0].id),
];

List<CartItem> sample = [CartItem(product: productsData[0], count: 1)];
