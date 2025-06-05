part of 'cart_bloc.dart';

sealed class CartEvent {}

class LoadCartEvent extends CartEvent {}

class AddCartItemEvent extends CartEvent {
  final int productId;
  AddCartItemEvent({required this.productId});
}

class UpdateCartItemEvent extends CartEvent {
  final int index;
  final int quantity;
  final int productId;
  UpdateCartItemEvent({
    required this.index,
    required this.quantity,
    required this.productId,
  });
}

class RemoveCartItemEvent extends CartEvent {
  final int index;
  final int productId;
  RemoveCartItemEvent({required this.index, required this.productId});
}

class ClearCartEvent extends CartEvent {}
