part of 'address_bloc.dart';

sealed class AddressEvent {}

class LoadAddressEvent extends AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final UserAddress address;
  AddAddressEvent({required this.address});
}

class UpdateAddressEvent extends AddressEvent {
  final int id;
  final UserAddress address;
  UpdateAddressEvent({required this.address, required this.id});
}

class DeleteAddressEvent extends AddressEvent {
  final int id;
  DeleteAddressEvent({required this.id});
}
