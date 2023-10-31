class BloodBankCartOrder {
  final String bloodBankId;
  final int quantity;
  final String providerId;

  const BloodBankCartOrder({
    required this.bloodBankId,
    required this.quantity,
    required this.providerId,
  });

  Map<String, dynamic> toJson() => {
        'bloodBankId': bloodBankId,
        'quantity': quantity,
        'providerId': providerId,
      };
}
