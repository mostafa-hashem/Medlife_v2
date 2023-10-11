import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medlife_v2/ui/resources/text_styles.dart';

class CustomPaymentContainer extends StatelessWidget {
  final String image;
  final String text;

  const CustomPaymentContainer({
    required this.image,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        border: Border.all(width: 0.50.w, color: const Color(0x4C2E3A58)),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 7.w,
          ),
          Image.asset(image),
          SizedBox(
            width: 8.w,
          ),
          Text(
            text,
            style: openSans12W400(color: Colors.black)
                .copyWith(letterSpacing: -0.21),
          ),
        ],
      ),
    );
  }
}
