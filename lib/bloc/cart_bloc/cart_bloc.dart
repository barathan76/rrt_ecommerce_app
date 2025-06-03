import 'package:cart_repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepo cartRepo = CartRepoService();
  CartBloc() : super(CartInitial()) {
    on<RemoveCartItemEvent>((event, emit) async {
      try {
        bool condition = await cartRepo.removeCartItem(event.index);
        if (condition == true) {
          List<CartItem> cartItems = [...state.cartItems];
          cartItems.removeAt(event.index);
          emit(CartUpdated(cartItems));
        }
      } catch (e) {
        emit(CartFailure([], e.toString()).copyWith(state));
      }
    });
    on<LoadCartEvent>((event, emit) async {
      emit(CartLoading());
      try {
        List<CartItem> cartItems = await cartRepo.getCartItems();
        emit(CartLoaded(cartItems));
      } catch (e) {
        emit(CartFailure([], e.toString()).copyWith(state));
      }
    });

    on<AddCartItemEvent>((event, emit) async {
      try {
        CartItem cartItem = await cartRepo.addCartItem(event.productId, 1);
        List<CartItem> cartItems = [...state.cartItems];
        cartItems.add(cartItem);
        emit(CartUpdated(cartItems));
      } catch (e) {
        emit(CartFailure([], e.toString()).copyWith(state));
      }
    });
    on<UpdateCartItemEvent>((event, emit) async {
      try {
        CartItem cartItem = await cartRepo.updateCartItem(
          event.productId,
          event.quantity,
        );
        List<CartItem> cartItems = [...state.cartItems];
        cartItems.removeAt(event.index);
        cartItems.insert(event.index, cartItem);
        emit(CartUpdated(cartItems));
      } catch (e) {
        emit(CartFailure([], e.toString()).copyWith(state));
      }
    });
  }
}
