import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    UserRepoAddress userRepoAddress = UserRepoAddressService();
    on<LoadAddressEvent>((event, emit) async {
      emit(AddressLoading());
      try {
        List<UserAddress> addressList = await userRepoAddress.getAddress();
        emit(AddressLoaded(addressList));
      } on UserRepoError catch (e) {
        emit(AddressFailure(state.addressList, msg: e.message));
      }
    });

    on<AddAddressEvent>((event, emit) async {
      // Optimistically add address with temp id if null
      UserAddress optimisticAddress =
          event.address.id == null
              ? event.address.copyWith(id: -1)
              : event.address;
      List<UserAddress> addressList = [...state.addressList, optimisticAddress];
      emit(AddressListUpdated(addressList));
      try {
        await userRepoAddress.addAddress(event.address);
        List<UserAddress> updatedList = await userRepoAddress.getAddress();
        emit(AddressListUpdated(updatedList));
      } on UserRepoError catch (e) {
        // Revert if API fails
        addressList.remove(optimisticAddress);
        emit(AddressFailure(addressList, msg: e.message));
      }
    });
    on<DeleteAddressEvent>((event, emit) async {
      // Optimistically delete address
      List<UserAddress> addressList = [...state.addressList];
      int idx = addressList.indexWhere((a) => a.id == event.id);
      UserAddress? removed;
      if (idx >= 0) {
        removed = addressList[idx];
        addressList.removeAt(idx);
        emit(AddressListUpdated(addressList));
      }
      try {
        await userRepoAddress.deleteAddress(event.id);
        List<UserAddress> updatedList = await userRepoAddress.getAddress();
        emit(AddressListUpdated(updatedList));
      } on UserRepoError catch (e) {
        // Revert if API fails
        if (removed != null) addressList.insert(idx, removed);
        emit(AddressFailure(addressList, msg: e.message));
      }
    });
    on<UpdateAddressEvent>((event, emit) async {
      // Optimistically update address, ensure id is not null
      List<UserAddress> addressList = [...state.addressList];
      int idx = addressList.indexWhere((a) => a.id == event.id);
      UserAddress? oldAddress;
      if (idx >= 0) {
        oldAddress = addressList[idx];
        UserAddress optimisticAddress =
            event.address.id == null
                ? event.address.copyWith(id: event.id)
                : event.address;
        addressList[idx] = optimisticAddress;
        emit(AddressListUpdated(addressList));
      }
      try {
        await userRepoAddress.updateAddress(event.address, event.id);
        List<UserAddress> updatedList = await userRepoAddress.getAddress();
        emit(AddressListUpdated(updatedList));
      } on UserRepoError catch (e) {
        // Revert if API fails
        if (oldAddress != null) addressList[idx] = oldAddress;
        emit(AddressFailure(addressList, msg: e.message));
      }
    });
  }
}
