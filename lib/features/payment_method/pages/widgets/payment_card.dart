import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCard extends StatelessWidget {
  final String image;
  const PaymentCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image)
        ],
      ),
    );
  }
}
