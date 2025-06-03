part of 'cart_bloc.dart';

sealed class CartState {
  final List<CartItem> cartItems;
  CartState(this.cartItems);

  CartState copyWith(CartState cartState);
}

class CartInitial extends CartState {
  CartInitial() : super([]);

  @override
  CartState copyWith(CartState cartState) {
    return CartInitial();
  }
}

class CartLoading extends CartState {
  CartLoading() : super([]);

  @override
  CartState copyWith(CartState cartState) {
    return CartLoading();
  }
}

class CartLoaded extends CartState {
  CartLoaded(super.cartItems);

  @override
  CartLoaded copyWith(CartState cartState) {
    return CartLoaded(cartItems);
  }
}

class CartUpdated extends CartState {
  CartUpdated(super.cartItems);

  @override
  CartUpdated copyWith(CartState cartState) {
    return CartUpdated(cartItems);
  }
}

class CartFailure extends CartState {
  final String msg;
  CartFailure(super.cartItems, this.msg);

  @override
  CartState copyWith(CartState cartState) {
    return CartFailure(cartState.cartItems, msg);
  }
}
