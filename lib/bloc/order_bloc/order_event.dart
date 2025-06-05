part of 'order_bloc.dart';

sealed class OrderEvent {}

class LoadOrdersEvent extends OrderEvent {}

class PlaceOrderEvent extends OrderEvent {
  final List<CartItem> cartItems;
  final UserAddress userAddress;
  PlaceOrderEvent(this.cartItems, this.userAddress);
}
