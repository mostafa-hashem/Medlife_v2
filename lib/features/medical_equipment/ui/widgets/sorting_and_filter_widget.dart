import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/filter_bottom_sheet.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/sorting_bottom_sheet.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class SortingAndFilterWidget extends StatefulWidget {
  const SortingAndFilterWidget();

  @override
  State<SortingAndFilterWidget> createState() => _SortingAndFilterWidgetState();
}

class _SortingAndFilterWidgetState extends State<SortingAndFilterWidget> {
  bool isSortingSelected = false;
  bool isFilterSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            showSortingSheet(context);
            setState(() {
              isSortingSelected = !isSortingSelected;
            });
          },
          child: Container(
            color: isSortingSelected ? AppColors.primary : null,
            height: 40.h,
            width: 150.w,
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
        SizedBox(width: 19.w),
        GestureDetector(
          onTap: () {
            showFilterSheet(context);
            setState(() {
              isFilterSelected = !isFilterSelected;
            });
          },
          child: Container(
            color: isFilterSelected ? AppColors.primary : null,
            height: 40.h,
            width: 150.w,
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
      ],
    );
  }

  void showSortingSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SortingBottomSheet();
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
        return const FilterBottomSheet();
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
