part of 'select_address_bloc.dart';

sealed class SelectAddressState {
  UserAddress? userAddress;
  SelectAddressState(this.userAddress);
}

class SelectAddressInitial extends SelectAddressState {
  SelectAddressInitial() : super(null);
}

class SelectAddressChanged extends SelectAddressState {
  SelectAddressChanged(super.userAddress);
}

class SelectAddressFailure extends SelectAddressState {
  String msg;
  SelectAddressFailure(super.userAddress, {required this.msg});
}
