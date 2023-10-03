import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/utils/text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  final String image;
  final String text;
  final int color;

  const CustomCategoryItem(
      {super.key,
      required this.image,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 11.w, vertical: 7.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color:  Color(color)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(text,
              textAlign: TextAlign.center,
              style: openSans10W500(color: Colors.black)),
        ],
      ),
    );
  }
}
