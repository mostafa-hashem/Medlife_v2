import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/filter_row.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet();

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 29.h, horizontal: 22.w),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filter Details",
                style: openSans20W600(color: Colors.white),
              ),
              SizedBox(
                height: 21.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const FilterRow(text: 'Product type',),
              SizedBox(
                height: 8.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const FilterRow(text: 'Price'),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const FilterRow(text: 'Brand'),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const FilterRow(text: 'Vendor'),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 72.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 145,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.0.h,
                          horizontal: 32.w,
                        ),
                        child: Center(
                          child: Text(
                            "Cancel",
                            style: openSans20W600(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    width: 205.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0.h,
                        horizontal: 32.w,
                      ),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: openSans20W600(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 27.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
