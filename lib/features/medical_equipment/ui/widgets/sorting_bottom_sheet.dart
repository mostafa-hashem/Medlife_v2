import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/sorting_row.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class SortingBottomSheet extends StatefulWidget {
  const SortingBottomSheet();

  @override
  State<SortingBottomSheet> createState() => _SortingBottomSheetState();
}

class _SortingBottomSheetState extends State<SortingBottomSheet> {
  bool isHighToLow = false;
  bool isLowToHigh = false;
  bool isDiscountSale = false;
  bool isRecentAdded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 20.w),
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isHighToLow = !isHighToLow;
                  isLowToHigh = false;
                  isDiscountSale = false;
                  isRecentAdded = false;
                });
              },
              child: SortingRow(
                text: "High to low price",
                icon: isHighToLow ? Icons.circle : Icons.circle_outlined,
                iconColor: isHighToLow ? AppColors.primary : Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isHighToLow = false;
                  isLowToHigh = !isLowToHigh;
                  isDiscountSale = false;
                  isRecentAdded = false;
                });
              },
              child: SortingRow(
                text: "Low to high price",
                icon: isLowToHigh ? Icons.circle : Icons.circle_outlined,
                iconColor: isLowToHigh ? AppColors.primary : Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isHighToLow = false;
                  isLowToHigh = false;
                  isDiscountSale = !isDiscountSale;
                  isRecentAdded = false;
                });
              },
              child: SortingRow(
                text: "Discount sale",
                icon: isDiscountSale ? Icons.circle : Icons.circle_outlined,
                iconColor: isDiscountSale ? AppColors.primary : Colors.white,
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isHighToLow = false;
                  isLowToHigh = false;
                  isDiscountSale = false;
                  isRecentAdded = !isRecentAdded;
                });
              },
              child: SortingRow(
                text: "Recent added",
                icon: isRecentAdded ? Icons.circle : Icons.circle_outlined,
                iconColor: isRecentAdded ? AppColors.primary : Colors.white,
              ),
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
