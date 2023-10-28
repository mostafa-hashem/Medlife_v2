import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/address.dart';

class Order {
  late final String id;
  final String status = 'Pending';
  final DateTime dateTime = DateTime.now();
  final OrderCost orderCost;
  final List<CartMedicalEquipment> cartMedicalEquipments;
  final List<CartMedicalService> cartMedicalServices;
  final Address address;
  final String phone;
  final String paymentMethod;
  final String vendorId;

  Order({
    required this.orderCost,
    required this.cartMedicalEquipments,
    required this.cartMedicalServices,
    required this.address,
    required this.phone,
    required this.paymentMethod,
    required this.vendorId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'dateTime': Timestamp.fromDate(dateTime),
        'orderCost': orderCost.toJson(),
        'medicalEquipments': cartMedicalEquipments,
        'medicalServices': cartMedicalServices,
        'address': address.toJson(),
        'phone': phone,
        'paymentMethod': paymentMethod,
        'vendorId': vendorId,
      };
}
