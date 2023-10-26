class MedicalEquipmentCartOrder {
  final String medicalEquipmentId;
  final int quantity;

  const MedicalEquipmentCartOrder({
    required this.medicalEquipmentId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'medicalEquipmentId': medicalEquipmentId,
        'quantity': quantity,
      };
}
