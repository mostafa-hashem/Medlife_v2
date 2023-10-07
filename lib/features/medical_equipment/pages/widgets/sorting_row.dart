import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class SortingRow extends StatelessWidget {
  final String text;

  const SortingRow({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.circle_outlined,
          color: Colors.white,
          size: 25,
          weight: 0.5,
        ),
        SizedBox(
          width: 6.w,
        ),
        Text(
          text,
          style: openSans16W400(color: Colors.white),
        ),
      ],
    );
  }
}
