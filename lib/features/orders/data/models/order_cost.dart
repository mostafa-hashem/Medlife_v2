import 'package:medlife_v2/utils/helper_methods.dart';

class OrderCost {
  final double subtotal;
  final double shipping;
  late final double vat = calculateVAT(subtotal, shipping);
  late final double total = calculateTotal(subtotal, shipping, vat);

  OrderCost({
    required this.subtotal,
    required this.shipping,
  });

  OrderCost.fromJson(Map<String, dynamic> json)
      : this(
    subtotal: (json['subtotal'] as num).toDouble(),
    shipping: (json['shipping'] as num).toDouble(),
  );

  Map<String, dynamic> toJson() {
    return {
      'subtotal': subtotal,
      'shipping': shipping,
      'vat': vat,
      'total': total,
    };
  }
}
