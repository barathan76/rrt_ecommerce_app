part of 'address_bloc.dart';

sealed class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  final List<UserAddress> addressList;
  AddressLoaded({required this.addressList});
}

class AddressListUpdated extends AddressState {
  final List<UserAddress> addressList;
  AddressListUpdated({required this.addressList});
}

class AddressFailure extends AddressState {
  String msg;
  AddressFailure({required this.msg});
}
