import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/orders/data/models/order_cost.dart';
import 'package:medlife_v2/utils/data/models/user.dart';

class Order {
  late final String id;
  final String? status;

  final DateTime? dateTime;

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
    this.status,
    this.dateTime,
  });

  Order.fromJson(Map<String, dynamic> json)
      : this(
          orderCost:
              OrderCost.fromJson(json['orderCost'] as Map<String, dynamic>),
          cartMedicalEquipments:
              (json['cartMedicalEquipments'] as List<dynamic>)
                  .map(
                    (equipment) => CartMedicalEquipment.fromJson(
                      equipment as Map<String, dynamic>,
                    ),
                  )
                  .toList(),
          cartMedicalServices: (json['cartMedicalServices'] as List<dynamic>)
              .map(
                (service) => CartMedicalService.fromJson(
                  service as Map<String, dynamic>,
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
