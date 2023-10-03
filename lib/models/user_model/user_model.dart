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
    secondName = json['secondName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
    };
  }
}
