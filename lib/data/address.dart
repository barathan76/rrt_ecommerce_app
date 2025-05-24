class Address {
  final String name;
  final int number;
  final int pincode;
  final String state;
  final String city;
  final String addressLine1;
  final String addressLine2;
  final AddressType addressType;
  final String? landMark;

  Address({
    required this.name,
    required this.number,
    required this.pincode,
    required this.state,
    required this.city,
    required this.addressLine1,
    required this.addressLine2,
    this.addressType = AddressType.home,
    this.landMark,
  });
}

enum AddressType { home, work, empty }
