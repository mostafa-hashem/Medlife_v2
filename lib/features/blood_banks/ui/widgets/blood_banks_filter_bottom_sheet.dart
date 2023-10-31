import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/blood_banks/ui/widgets/blood_banks_filter_row.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class BloodBanksFilterBottomSheet extends StatefulWidget {
  const BloodBanksFilterBottomSheet();

  @override
  State<BloodBanksFilterBottomSheet> createState() =>
      _BloodBanksFilterBottomSheetState();
}

class _BloodBanksFilterBottomSheetState
    extends State<BloodBanksFilterBottomSheet> {
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
              const BloodBanksFilterRow(
                text: 'Product type',
              ),
              SizedBox(
                height: 8.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const BloodBanksFilterRow(text: 'Price'),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const BloodBanksFilterRow(text: 'Brand'),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              const BloodBanksFilterRow(text: 'Vendor'),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.h,
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
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(color: Colors.white),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 15.h,
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
