import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodCard extends StatelessWidget {
  final String image;

  const PaymentMethodCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 8.w),
        child: Row(
          children: [
            Image.asset(image),
            const Spacer(),
            const Icon(Icons.circle_outlined),
          ],
        ),
      ),
    );
  }
}
