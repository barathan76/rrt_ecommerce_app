part of 'order_bloc.dart';

sealed class OrderState {
  final List<Order> orders;
  OrderState(this.orders);
}

class OrderInitial extends OrderState {
  OrderInitial() : super([]);
}

class OrderLoading extends OrderState {
  OrderLoading() : super([]);
}

class OrderLoaded extends OrderState {
  OrderLoaded(super.orders);
}

class OrderFailure extends OrderState {
  final String msg;
  OrderFailure(super.orders, this.msg);
}

class OrderUpdated extends OrderState {
  OrderUpdated(super.orders);
}
