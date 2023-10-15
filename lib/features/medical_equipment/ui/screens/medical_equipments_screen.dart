import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/filter_bottom_sheet.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/medical_equipments_products_list.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/sorting_and_filter_widget.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/sorting_bottom_sheet.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';
import 'package:medlife_v2/ui/widgets/search_widget.dart';

class MedicalEquipmentsScreen extends StatefulWidget {
  const MedicalEquipmentsScreen();

  @override
  State<MedicalEquipmentsScreen> createState() =>
      _MedicalEquipmentsScreenState();
}

class _MedicalEquipmentsScreenState extends State<MedicalEquipmentsScreen> {
  @override
  Widget build(BuildContext context) {
    final routes = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.only(top: 68.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 17.w,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 44.w,
                    height: 42.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11.76.r),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x23EA6A58),
                          blurRadius: 20,
                          offset: Offset(0, 4.41),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(width: 75.w),
                Text(
                  routes.toString(),
                  style: openSans16W500(color: const Color(0xff576A69)),
                ),
              ],
            ),
            SizedBox(height: 13.h),
            const SearchWidget(),
            SizedBox(height: 12.h),
            Image.asset(
              "assets/images/medicalImage.png",
            ),
            SizedBox(height: 7.h),
            Container(
              height: 54.h,
              decoration: BoxDecoration(
                color: const Color(0xffF1F4F6),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => showSortingSheet(context),
                      child: const SortingAndFilterWidget(
                        text: "Sorting",
                        iconData: Icons.sort_outlined,
                      ),
                    ),
                    SizedBox(width: 19.w),
                    GestureDetector(
                      onTap: () => showFilterSheet(context),
                      child: const SortingAndFilterWidget(
                        text: "Filter",
                        iconData: Icons.filter_alt_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            const MedicalEquipmentsProductsList(),
          ],
        ),
      ),
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
    );
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
    );
  }
}
