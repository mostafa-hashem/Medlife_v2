import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';

class CartMedicalService {
  final MedicalService medicalService;
  final int quantity;

  const CartMedicalService({
    required this.medicalService,
    required this.quantity,
  });

  CartMedicalService.fromJson(Map<String, dynamic> json)
      : this(
          medicalService: MedicalService.fromJson(
            json['medicalService'] as Map<String, dynamic>,
          ),
          quantity: json['quantity'] as int,
        );

  Map<String, dynamic> toJson() => {
        'medicalService': medicalService.toJson(),
        'quantity': quantity,
      };
}
