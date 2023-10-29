class MedicalEquipmentCartOrder {
  final String medicalEquipmentId;
  final String vendorId;
  final int quantity;

  const MedicalEquipmentCartOrder({
    required this.medicalEquipmentId,
    required this.vendorId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'medicalEquipmentId': medicalEquipmentId,
        'quantity': quantity,
      };
}
