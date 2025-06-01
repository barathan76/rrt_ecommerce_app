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
        emit(AddressLoaded(addressList: addressList));
      } catch (_) {
        emit(AddressFailure());
      }
    });

    on<AddAddressEvent>((event, emit) async {
      emit(AddressLoading());
      try {
        await userRepoAddress.addAddress(event.address);
        List<UserAddress> addressList = await userRepoAddress.getAddress();
        emit(AddressLoaded(addressList: addressList));
      } catch (_) {
        emit(AddressFailure());
      }
    });
  }
}
