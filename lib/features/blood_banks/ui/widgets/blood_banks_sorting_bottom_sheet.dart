import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/medical_equipments_sorting_row.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class BloodBanksSortingBottomSheet extends StatefulWidget {
  const BloodBanksSortingBottomSheet();

  @override
  State<BloodBanksSortingBottomSheet> createState() => _BloodBanksSortingBottomSheetState();
}

class _BloodBanksSortingBottomSheetState extends State<BloodBanksSortingBottomSheet> {
  bool isHighToLow = false;
  bool isLowToHigh = false;
  bool isOffer = false;
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
                  isOffer = false;
                  isRecentAdded = false;
                });
              },
              child: MedicalEquipmentSortingRow(
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
                  isOffer = false;
                  isRecentAdded = false;
                });
              },
              child: MedicalEquipmentSortingRow(
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
                  isOffer = !isOffer;
                  isRecentAdded = false;
                });
              },
              child: MedicalEquipmentSortingRow(
                text: "Offers",
                icon: isOffer ? Icons.circle : Icons.circle_outlined,
                iconColor: isOffer ? AppColors.primary : Colors.white,
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
                  isOffer = false;
                  isRecentAdded = !isRecentAdded;
                });
              },
              child: MedicalEquipmentSortingRow(
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
