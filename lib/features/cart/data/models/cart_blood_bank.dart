import 'package:medlife_v2/features/blood_banks/data/models/blood_bank.dart';

class CartBloodBank {
  final BloodBank bloodBank;
  final int quantity;

  const CartBloodBank({
    required this.bloodBank,
    required this.quantity,
  });

  CartBloodBank.fromJson(Map<String, dynamic> json)
      : this(
          bloodBank: BloodBank.fromJson(
            json['bloodBank'] as Map<String, dynamic>,
          ),
          quantity: json['quantity'] as int,
        );

  Map<String, dynamic> toJson() => {
        'bloodBank': bloodBank.toJson(),
        'quantity': quantity,
      };
}
