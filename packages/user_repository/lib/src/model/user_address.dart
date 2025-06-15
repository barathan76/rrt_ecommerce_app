class UserAddress {
  final int? id;
  final String name;
  final String number;
  final int pincode;
  final String state;
  final String city;
  final String addressLine1;
  final String addressLine2;
  final AddressType addressType;
  final String? landMark;

  UserAddress({
    this.id,
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
  UserAddress copyWith({
    int? id,
    String? name,
    String? number,
    int? pincode,
    String? state,
    String? city,
    String? addressLine1,
    String? addressLine2,
    AddressType? addressType,
    String? landMark,
  }) {
    return UserAddress(
      id: id ?? this.id,
      name: name ?? this.name,
      number: number ?? this.number,
      pincode: pincode ?? this.pincode,
      state: state ?? this.state,
      city: city ?? this.city,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressType: addressType ?? this.addressType,
      landMark: landMark ?? this.landMark,
    );
  }

  factory UserAddress.fromMap(Map<String, dynamic> map) {
    print('in Address conversion $map');
    return UserAddress(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      pincode: map['pincode'],
      state: map['state'],
      city: map['city'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      addressType:
          map['addressType'] == 'home'
              ? AddressType.home
              : map['addressType'] == 'work'
              ? AddressType.work
              : AddressType.empty,
      landMark: map['landMark'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'pincode': pincode,
      'state': state,
      'city': city,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'addressType':
          addressType == AddressType.home
              ? 'home'
              : addressType == AddressType.work
              ? 'work'
              : 'empty',

      'landMark': landMark,
    };
  }

  @override
  String toString() {
    return 'UserAddress(id: $id, name: $name, number: $number, pincode: $pincode, '
        'state: $state, city: $city, addressLine1: $addressLine1, '
        'addressLine2: $addressLine2, addressType: $addressType, '
        'landMark: ${landMark ?? "N/A"})';
  }

  bool equals(Object other) {
    if (other is UserAddress && other.id == id) {
      return true;
    }
    return false;
  }
}

enum AddressType { home, work, empty }
