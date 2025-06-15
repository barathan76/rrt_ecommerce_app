part of 'select_address_bloc.dart';

sealed class SelectAddressEvent {}

class ChangeSelectAddressEvent extends SelectAddressEvent {
  final UserAddress? userAddress;
  ChangeSelectAddressEvent(this.userAddress);
}

class InitSelectAddressEvent extends SelectAddressEvent {}
