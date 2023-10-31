import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/blood_banks/ui/widgets/blood_banks_filter_bottom_sheet.dart';
import 'package:medlife_v2/features/blood_banks/ui/widgets/blood_banks_sorting_bottom_sheet.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class BloodBanksSortingAndFilterWidget extends StatefulWidget {
  const BloodBanksSortingAndFilterWidget();

  @override
  State<BloodBanksSortingAndFilterWidget> createState() => _BloodBanksSortingAndFilterWidgetState();
}

class _BloodBanksSortingAndFilterWidgetState extends State<BloodBanksSortingAndFilterWidget> {
  bool isSortingSelected = false;
  bool isFilterSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              showSortingSheet(context);
              setState(() {
                isSortingSelected = !isSortingSelected;
              });
            },
            child: Container(
              color: isSortingSelected ? AppColors.primary : null,
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sorting",
                    style: isSortingSelected
                        ? openSans12W600(color: Colors.white)
                        : openSans12W600(color: const Color(0xff1E1E1E)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.sort_outlined,
                    size: 19,
                    color: isSortingSelected ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 19.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              showFilterSheet(context);
              setState(() {
                isFilterSelected = !isFilterSelected;
              });
            },
            child: Container(
              color: isFilterSelected ? AppColors.primary : null,
              height: 40.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Filter",
                    style: isFilterSelected
                        ? openSans12W600(color: Colors.white)
                        : openSans12W600(color: const Color(0xff1E1E1E)),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.filter_alt_outlined,
                    size: 19,
                    color: isFilterSelected ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showSortingSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BloodBanksSortingBottomSheet();
      },
      isScrollControlled: true,
      backgroundColor: const Color(0xff323434),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
      ),
    ).whenComplete(() {
      setState(() {
        isSortingSelected = !isSortingSelected;
      });
    });
  }

  void showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const BloodBanksFilterBottomSheet();
      },
      isScrollControlled: true,
      backgroundColor: const Color(0xff323434),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25.r),
          topLeft: Radius.circular(25.r),
        ),
      ),
    ).whenComplete(() {
      setState(() {
        isFilterSelected = !isFilterSelected;
      });
    });
  }
}
