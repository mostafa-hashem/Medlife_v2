import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class ShippingMethodRow extends StatelessWidget {
  const ShippingMethodRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(Icons.circle_outlined),
            SizedBox(width: 6.w),
            Text(
              "Pick up from store",
              style: openSans12W600(color: const Color(0xff1A1A1A)),
            ),
          ],
        ),
        SizedBox(
          width: 77.w,
        ),
        Row(
          children: [
            const Icon(Icons.circle_outlined),
            SizedBox(width: 6.w),
            Text(
              "Home delivery",
              style: openSans12W600(color: const Color(0xff1A1A1A)),
            ),
          ],
        ),
      ],
    );
  }
}
