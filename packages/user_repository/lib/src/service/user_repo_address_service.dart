import 'package:api_repository/api_repository.dart';
import 'package:user_repository/src/exception/user_exception.dart';
import 'package:user_repository/src/model/user_address.dart';
import 'package:user_repository/src/usecase/user_repo_address.dart';

class UserRepoAddressService implements UserRepoAddress {
  ApiAddress apiAddress = ApiAddressService();
  @override
  Future<void> addAddress(UserAddress userAddress) async {
    try {
      await apiAddress.addAddress(userAddress.toMap());
    } on ApiError catch (e) {
      throw UserRepoError(message: e.message);
    } catch (e) {
      throw UserRepoError(message: e.toString());
    }
  }

  @override
  Future<void> deleteAddress(int id) async {
    try {
      await apiAddress.deleteAddress(id);
    } on ApiError catch (e) {
      throw UserRepoError(message: e.message);
    } catch (e) {
      throw UserRepoError(message: e.toString());
    }
  }

  @override
  Future<List<UserAddress>> getAddress() async {
    try {
      final x = await apiAddress.getAddresses();
      return x.map((y) => UserAddress.fromMap(y)).toList();
    } on ApiError catch (e) {
      throw UserRepoError(message: e.message);
    } catch (e) {
      throw UserRepoError(message: e.toString());
    }
  }

  @override
  Future<void> updateAddress(UserAddress userAddress, int id) async {
    try {
      await apiAddress.updateAddress(id, userAddress.copyWith(id: id).toMap());
    } on ApiError catch (e) {
      throw UserRepoError(message: e.message);
    } catch (e) {
      throw UserRepoError(message: e.toString());
    }
  }
}
