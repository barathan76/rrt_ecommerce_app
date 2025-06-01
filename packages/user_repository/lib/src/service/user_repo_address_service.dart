import 'package:user_repository/src/model/user_address.dart';
import 'package:user_repository/src/usecase/user_repo_address.dart';

class UserRepoAddressService implements UserRepoAddress {
  @override
  Future<void> addAddress(UserAddress userAddress) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAddress(UserAddress userAddress) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<List<UserAddress>> getAddress() {
    // TODO: implement getAddress
    throw UnimplementedError();
  }

  @override
  Future<void> updateAddress(UserAddress userAddress) {
    // TODO: implement updateAddress
    throw UnimplementedError();
  }
}
