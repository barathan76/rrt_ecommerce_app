abstract class ApiAddress {
  Future<List> getAddresses();
  Future<void> updateAddress(int id, Map<String, dynamic> address);
  Future<void> addAddress(Map<String, dynamic> address);
  Future<void> deleteAddress(int id);
}
