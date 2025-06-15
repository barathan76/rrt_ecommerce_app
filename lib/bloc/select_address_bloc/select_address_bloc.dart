import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'select_address_event.dart';
part 'select_address_state.dart';

class SelectAddressBloc extends Bloc<SelectAddressEvent, SelectAddressState> {
  SelectAddressBloc() : super(SelectAddressInitial()) {
    UserRepoAddress userRepoAddress = UserRepoAddressService();
    on<InitSelectAddressEvent>((event, emit) async {
      try {
        UserAddress? userAddress = await userRepoAddress.getSelectedAddress();
        emit(SelectAddressChanged(userAddress));
      } on UserRepoError catch (e) {
        emit(SelectAddressFailure(state.userAddress, msg: e.message));
      } catch (e) {
        emit(SelectAddressFailure(state.userAddress, msg: e.toString()));
      }
    });
    on<ChangeSelectAddressEvent>((event, emit) async {
      try {
        if (event.userAddress != null) {
          await userRepoAddress.selectAddress(event.userAddress!.id!);
        }
        emit(SelectAddressChanged(event.userAddress));
      } on UserRepoError catch (e) {
        emit(SelectAddressFailure(state.userAddress, msg: e.message));
      } catch (e) {
        emit(SelectAddressFailure(state.userAddress, msg: e.toString()));
      }
    });
  }
}
