class OrderCost {
  final double subtotal;
  final double deliveryFee;
  final double discount;
  final double taxes;
  late final double total = subtotal + deliveryFee - discount + taxes;

  OrderCost({
    required this.subtotal,
    required this.deliveryFee,
    required this.discount,
    required this.taxes,
  });

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'discount': discount,
      'taxes': taxes,
      'total': total,
    };
  }
}
