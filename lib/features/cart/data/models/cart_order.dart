class CartOrder {
  final String medicalEquipmentId;
  final int quantity;

  const CartOrder({
    required this.medicalEquipmentId,
    required this.quantity,
  });

  Map<String, dynamic> toJson() => {
        'medicalEquipmentId': medicalEquipmentId,
        'quantity': quantity,
      };
}
