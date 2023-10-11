import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medlife_v2/features/medical_equipment/ui/widgets/sorting_row.dart';

class SortingBottomSheet extends StatelessWidget {
  const SortingBottomSheet();

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
