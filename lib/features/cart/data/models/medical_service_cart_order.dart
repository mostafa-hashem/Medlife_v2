class MedicalServiceCartOrder {
  final String medicalServiceId;
  final int quantity;
  final String providerId;

  const MedicalServiceCartOrder({
    required this.medicalServiceId,
    required this.quantity,
    required this.providerId,
  });

  Map<String, dynamic> toJson() => {
        'medicalServiceId': medicalServiceId,
        'quantity': quantity,
        'providerId': providerId,
      };
}
