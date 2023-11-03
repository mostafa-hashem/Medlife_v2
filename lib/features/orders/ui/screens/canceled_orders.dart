import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/canceled_orders_list.dart';

class CanceledOrders extends StatelessWidget {
  const CanceledOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CanceledOrdersList(),
        ],
      ),
    );
  }
}
