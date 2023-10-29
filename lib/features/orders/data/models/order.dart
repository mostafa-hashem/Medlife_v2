import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/user.dart';

class Order {
  late final String id;
  final String status = 'Pending';
  final DateTime dateTime = DateTime.now();
  final OrderCost orderCost;
  final List<CartMedicalEquipment> cartMedicalEquipments;
  final List<CartMedicalService> cartMedicalServices;
  final User buyer;
  final String paymentMethod;
  final String vendorId;

  Order({
    required this.orderCost,
    required this.cartMedicalEquipments,
    required this.cartMedicalServices,
    required this.buyer,
    required this.paymentMethod,
    required this.vendorId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'dateTime': Timestamp.fromDate(dateTime),
        'orderCost': orderCost.toJson(),
        'cartMedicalEquipments': cartMedicalEquipments
            .map((equipment) => equipment.toJson())
            .toList(),
        'cartMedicalServices':
            cartMedicalServices.map((service) => service.toJson()).toList(),
        'buyer': buyer.toJson(),
        'paymentMethod': paymentMethod,
        'vendorId': vendorId,
      };
}
