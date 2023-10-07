class User {
  static const String collectionName = "Users";
  String? id;
  String? idNumber;
  String? firstName;
  String? lastName;
  String? email;

  User({
    required this.id,
    this.idNumber = '',
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    firstName = json['firstName'] as String?;
    email = json['email'] as String?;
    idNumber = json['idNumber'] as String?;
    lastName = json['secondName'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'idNumber': idNumber,
      'secondName': lastName,
    };
  }
}
