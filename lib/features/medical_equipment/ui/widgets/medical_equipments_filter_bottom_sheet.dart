import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_cubit.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/medical_equipments_filter_row.dart';
import 'package:medlife_v2/ui/resources/text_styles.dart';

class MedicalEquipmentsFilterBottomSheet extends StatefulWidget {
  const MedicalEquipmentsFilterBottomSheet();

  @override
  State<MedicalEquipmentsFilterBottomSheet> createState() =>
      _MedicalEquipmentsFilterBottomSheetState();
}

class _MedicalEquipmentsFilterBottomSheetState
    extends State<MedicalEquipmentsFilterBottomSheet> {
  String? filterType;

  void changeFilterType(String newFilterType) {
    setState(() {
      filterType = newFilterType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final medicalEquipmentsCubit = MedicalEquipmentsCubit.get(context);
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
              Center(
                child: Text(
                  filterType ?? "",
                  style: openSans20W600(color: Colors.white),
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              MedicalEquipmentsFilterRow(
                onFilterTypeChanged: changeFilterType,
                text: 'Product type',
                options: medicalEquipmentsCubit.productTypes,
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
              MedicalEquipmentsFilterRow(
                onFilterTypeChanged: changeFilterType,
                text: 'Price',
                options: medicalEquipmentsCubit.priceRanges,
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              MedicalEquipmentsFilterRow(
                onFilterTypeChanged: changeFilterType,
                text: 'Brand',
                options: medicalEquipmentsCubit.brands,
              ),
              SizedBox(
                height: 16.h,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                height: 18.h,
              ),
              MedicalEquipmentsFilterRow(
                onFilterTypeChanged: changeFilterType,
                text: 'Vendor',
                options: medicalEquipmentsCubit.vendors,
              ),
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
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
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
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
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
