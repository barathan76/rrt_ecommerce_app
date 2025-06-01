class UserProfile {
  String? firstName;
  String? lastName;
  String email;
  String? mobileNumber;
  String? profileImage;

  UserProfile({
    required this.email,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.profileImage,
  });
  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      email: map['email']!,
      firstName: map['firstName'],
      lastName: map['lastName'],
      mobileNumber: map['mobileNumber'],
      profileImage: map['profileImage'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'mobileNumber': mobileNumber,
      'profileImage': profileImage,
    };
  }
}
