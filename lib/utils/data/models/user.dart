class User {
  String? id;
  String? idNumber;
  String? dateOfBirth;
  String? address;
  String? companyInsuranceName;
  String? firstName;
  String? lastName;
  String? email;

  User({
    required this.id,
    this.idNumber = '',
    this.dateOfBirth = '',
    this.address = '',
    this.companyInsuranceName = '',
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    firstName = json['firstName'] as String?;
    email = json['email'] as String?;
    idNumber = json['idNumber'] as String?;
    dateOfBirth = json['dateOfBirth'] as String?;
    address = json['address'] as String?;
    companyInsuranceName = json['companyInsuranceName'] as String?;
    lastName = json['secondName'] as String?;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'email': email,
      'idNumber': idNumber,
      'dateOfBirth': dateOfBirth,
      'address': address,
      'companyInsuranceName': companyInsuranceName,
      'secondName': lastName,
    };
  }
}
