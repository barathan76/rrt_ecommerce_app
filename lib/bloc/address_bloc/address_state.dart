part of 'address_bloc.dart';

sealed class AddressState {
  final List<UserAddress> addressList;
  AddressState(this.addressList);
}

class AddressInitial extends AddressState {
  AddressInitial() : super([]);
}

class AddressLoading extends AddressState {
  AddressLoading() : super([]);
}

class AddressLoaded extends AddressState {
  AddressLoaded(super.addressList);
}

class AddressListUpdated extends AddressState {
  AddressListUpdated(super.addressList);
}

class AddressFailure extends AddressState {
  String msg;
  AddressFailure(super.addressList, {required this.msg});
}
