import 'package:cart_repository/cart_repository.dart'
    show CartError, CartItem, Order, OrderRepo, OrderRepoService;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';
part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderRepo orderRepo = OrderRepoService();
  OrderBloc() : super(OrderInitial()) {
    on<LoadOrdersEvent>((event, emit) async {
      emit(OrderLoading());
      try {
        List<Order> orders = await orderRepo.getUserOrders();
        emit(OrderLoaded(orders));
      } on CartError catch (e) {
        emit(OrderFailure(state.orders, e.msg));
      } catch (e) {
        emit(OrderFailure(state.orders, e.toString()));
      }
    });

    on<PlaceOrderEvent>((event, emit) async {
      try {
        await orderRepo.placeOrder(event.cartItems, event.userAddress);
        List<Order> orders = await orderRepo.getUserOrders();
        emit(OrderUpdated(orders));
      } on CartError catch (e) {
        emit(OrderFailure(state.orders, e.msg));
      } catch (e) {
        emit(OrderFailure(state.orders, e.toString()));
      }
    });
  }
}
