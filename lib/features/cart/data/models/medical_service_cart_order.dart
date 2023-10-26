class MedicalServiceCartOrder {
  final String medicalServiceId;
  final int quantity;

  const MedicalServiceCartOrder({
    required this.medicalServiceId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'medicalServiceId': medicalServiceId,
        'quantity': quantity,
      };
}
