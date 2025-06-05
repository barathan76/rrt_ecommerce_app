import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'select_address_event.dart';
part 'select_address_state.dart';

class SelectAddressBloc extends Bloc<SelectAddressEvent, SelectAddressState> {
  SelectAddressBloc() : super(SelectAddressInitial()) {
    on<ChangeSelectAddressEvent>((event, emit) async {
      emit(SelectAddressChanged(event.userAddress));
    });
  }
}
