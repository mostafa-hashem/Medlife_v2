import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/cart/data/models/cart_blood_bank.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/user.dart';

class Order {
  late final String id;
  final String? status;
  final DateTime? dateTime;
  final OrderCost cost;
  final List<CartMedicalEquipment> cartMedicalEquipments;
  final List<CartMedicalService> cartMedicalServices;
  final List<CartBloodBank> cartBloodBanks;
  final User buyer;
  final String paymentMethod;
  final String vendorId;

  Order({
    required this.cost,
    required this.cartMedicalEquipments,
    required this.cartMedicalServices,
    required this.cartBloodBanks,
    required this.buyer,
    required this.paymentMethod,
    required this.vendorId,
    this.status,
    this.dateTime,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          cost: OrderCost.fromJson(json['orderCost'] as Map<String, dynamic>),
          cartMedicalEquipments:
              (json['cartMedicalEquipments'] as List<dynamic>)
                  .map(
                    (equipmentJson) => CartMedicalEquipment.fromJson(
                      equipmentJson as Map<String, dynamic>,
                    ),
                  )
                  .toList(),
          cartMedicalServices: (json['cartMedicalServices'] as List<dynamic>)
              .map(
                (serviceJson) => CartMedicalService.fromJson(
                  serviceJson as Map<String, dynamic>,
                ),
              )
              .toList(),
          cartBloodBanks: (json['cartBloodBanks'] as List<dynamic>)
              .map(
                (bloodBankJson) => CartBloodBank.fromJson(
                  bloodBankJson as Map<String, dynamic>,
                ),
              )
              .toList(),
          buyer: User.fromJson(json['buyer'] as Map<String, dynamic>),
          paymentMethod: json['paymentMethod'] as String,
          vendorId: json['vendorId'] as String,
          status: json['status'] as String,
          dateTime: (json['dateTime'] as Timestamp).toDate(),
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': 'Pending',
        'dateTime': Timestamp.fromDate(DateTime.now()),
        'orderCost': cost.toJson(),
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
