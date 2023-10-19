import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';

class Cart {
  final List<CartMedicalEquipment> cartMedicalEquipments;

  const Cart({
    required this.cartMedicalEquipments,
  });

  Cart.fromJson(Map<String, dynamic> json)
      : this(
          cartMedicalEquipments: (json['cartMedicalEquipments'] as List)
              .map(
                (json) =>
                    CartMedicalEquipment.fromJson(json as Map<String, dynamic>),
              )
              .toList(),
        );
}
