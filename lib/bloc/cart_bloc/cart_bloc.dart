import 'package:cart_repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepo cartRepo = CartRepoService();
  CartBloc() : super(CartInitial()) {
    on<RemoveCartItemEvent>((event, emit) async {
      // Optimistically update state
      List<CartItem> cartItems = [...state.cartItems];
      CartItem? removedItem;
      if (event.index < cartItems.length) {
        removedItem = cartItems[event.index];
        cartItems.removeAt(event.index);
        emit(CartUpdated(cartItems));
      }
      try {
        bool condition = await cartRepo.removeCartItem(event.productId);
        if (!condition && removedItem != null) {
          // Revert if API fails
          cartItems.insert(event.index, removedItem);
          emit(CartFailure(cartItems, 'Failed to remove item').copyWith(state));
        }
      } catch (e) {
        if (removedItem != null) cartItems.insert(event.index, removedItem);
        emit(CartFailure(cartItems, e.toString()).copyWith(state));
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
      // Optimistically add item
      List<CartItem> cartItems = [...state.cartItems];
      CartItem placeholder = CartItem(
        id: event.product.id,
        product: event.product,
        quantity: 1,
      );
      cartItems.add(placeholder);
      emit(CartUpdated(cartItems));
      try {
        CartItem cartItem = await cartRepo.addCartItem(event.product.id, 1);
        // Replace placeholder with actual CartItem from API
        int idx = cartItems.indexWhere((c) => c.product.id == event.product.id);
        if (idx >= 0) cartItems[idx] = cartItem;
        emit(CartUpdated(cartItems));
      } catch (e) {
        cartItems.removeWhere((c) => c.product.id == event.product.id);
        emit(CartFailure(cartItems, e.toString()).copyWith(state));
      }
    });
    on<UpdateCartItemEvent>((event, emit) async {
      // Optimistically update item
      List<CartItem> cartItems = [...state.cartItems];
      CartItem? oldItem;
      if (event.index < cartItems.length) {
        oldItem = cartItems[event.index];
        cartItems[event.index] = CartItem(
          id: oldItem.id,
          product: oldItem.product,
          quantity: event.quantity,
        ); // Placeholder with updated quantity
        emit(CartUpdated(cartItems));
      }
      try {
        CartItem cartItem = await cartRepo.updateCartItem(
          event.productId,
          event.quantity,
        );
        cartItems[event.index] = cartItem;
        emit(CartUpdated(cartItems));
      } catch (e) {
        // Revert if API fails
        if (oldItem != null) cartItems[event.index] = oldItem;
        emit(CartFailure(cartItems, e.toString()).copyWith(state));
      }
    });
    on<ClearCartEvent>((event, emit) async {
      // Optimistically clear cart
      List<CartItem> previousItems = [...state.cartItems];
      emit(CartUpdated([]));
      try {
        await cartRepo.clearCart();
      } catch (e) {
        // Revert if API fails
        emit(CartFailure(previousItems, e.toString()));
      }
    });
  }
}
