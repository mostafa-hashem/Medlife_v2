import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class SortingAndFilterWidget extends StatelessWidget {
  final String text;
  final IconData iconData;

  const SortingAndFilterWidget({
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      width: 150.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: openSans12W600(color: const Color(0xff1E1E1E)),
          ),
          SizedBox(
            width: 5.w,
          ),
          Icon(
            iconData,
            size: 19,
          ),
        ],
      ),
    );
  }
}
