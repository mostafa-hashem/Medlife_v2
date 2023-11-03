import 'package:flutter/material.dart';
import 'package:medlife_v2/features/orders/ui/widgets/delivered_orders_list.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          DeliveredOrdersList(),
        ],
      ),
    );
  }
}
