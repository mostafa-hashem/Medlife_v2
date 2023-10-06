class UserModel {
  static const String COLLECTIN_NAME = "Users";
  String? id;
  String? firstName;
  String? secondName;
  String? email;

  UserModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.email,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    email = json['email'];
    secondName = json['secondName'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'secondName': secondName,
    };
  }
}
