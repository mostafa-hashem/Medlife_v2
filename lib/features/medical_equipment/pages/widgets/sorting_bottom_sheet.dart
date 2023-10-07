import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sorting_row.dart';

class SortingBottomSheet extends StatelessWidget {
  const SortingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 20.w),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SortingRow(
              text: "High to low price",
            ),
            SizedBox(
              height: 24.h,
            ),
            const SortingRow(
              text: "High to low price",
            ),
            SizedBox(
              height: 24.h,
            ),
            const SortingRow(
              text: "High to low price",
            ),
            SizedBox(
              height: 24.h,
            ),
            const SortingRow(
              text: "High to low price",
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
