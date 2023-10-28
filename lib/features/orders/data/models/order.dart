import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/address.dart';

class Order {
  late final String id;
  final String status;
  final DateTime dateTime;
  final OrderCost orderCost;
  final List<MedicalEquipment> medicalEquipments;
  final List<MedicalService> medicalServices;
  final Address address;
  final String phone;
  final String paymentMethod;
  final String vendorId;

  Order({
    required this.status,
    required this.dateTime,
    required this.orderCost,
    required this.medicalEquipments,
    required this.medicalServices,
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
        'medicalEquipments':
            medicalEquipments.map((equipment) => equipment.toJson()).toList(),
        'medicalServices':
            medicalServices.map((service) => service.toJson()).toList(),
        'address': address.toJson(),
        'phone': phone,
        'paymentMethod': paymentMethod,
        'vendorId': vendorId,
      };
}
