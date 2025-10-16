class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;

  String get fullName {
    return '$firstName $lastName';
  }

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['_id']?.toString() ?? '',
      email: jsonData['email']?.toString() ?? '',
      firstName: jsonData['firstName']?.toString() ?? '',
      lastName: jsonData['lastName']?.toString() ?? '',
      mobile: jsonData['mobile']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
    };
  }
}
