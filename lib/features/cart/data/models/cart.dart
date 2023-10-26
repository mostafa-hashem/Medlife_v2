import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';

class Cart {
  final List<CartMedicalEquipment> cartMedicalEquipments;
  final List<CartMedicalService> cartMedicalServices;

  const Cart({
    required this.cartMedicalEquipments,
    required this.cartMedicalServices,
  });
}
