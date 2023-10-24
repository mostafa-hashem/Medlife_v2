import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';

String? validateEmail(String? value) {
  final RegExp regex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  if (value == null || value.isEmpty) {
    return "Please Enter Email";
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid Email';
    } else {
      return null;
    }
  }
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter password';
  } else if (value.length < 6) {
    return "Password can't be less than 6 characters";
  }

  return null;
}

String? validateGeneral(String? value, String label) {
  if (value == null || value.isEmpty) {
    return 'Please enter $label';
  }
  return null;
}

double calculateProductsPrice(List<CartMedicalEquipment> cartItems) {
  double totalPrice = 0.0;
  cartItems.map((cartItem) {
    totalPrice += cartItem.medicalEquipment.price * cartItem.quantity;
  }).toList();
  return totalPrice;
}

double calculateItemPrice(int quantity, double price) {
  final double totalPrice = quantity * price;
  return totalPrice;
}

double calculateTotalPrice(
    {required double price, required List<double> summery}) {
  for (int i = 0; i < summery.length; i++) {
    price += summery[i];
  }
  return price;
}
