import 'package:user_repository/src/model/user_address.dart';

abstract class UserRepoAddress {
  Future<List<UserAddress>> getAddress();
  Future<void> addAddress(UserAddress userAddress);
  Future<void> updateAddress(UserAddress userAddress);
  Future<void> deleteAddress(UserAddress userAddress);
}
