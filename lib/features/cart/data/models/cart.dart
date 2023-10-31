import 'package:medlife_v2/features/cart/data/models/cart_blood_bank.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';

class Cart {
  final List<CartMedicalEquipment> cartMedicalEquipments;
  final List<CartMedicalService> cartMedicalServices;
  final List<CartBloodBank> cartBloodBanks;

  const Cart({
    required this.cartMedicalEquipments,
    required this.cartMedicalServices,
    required this.cartBloodBanks,
  });
}
