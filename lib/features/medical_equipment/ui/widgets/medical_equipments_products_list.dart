import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/blood_banks/cubit/blood_banks_cubit.dart';
import 'package:medlife_v2/features/blood_banks/ui/widgets/blood_banks_product_item.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_cubit.dart';
import 'package:medlife_v2/route_manager.dart';

class MedicalEquipmentsProductsList extends StatelessWidget {
  const MedicalEquipmentsProductsList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          mainAxisExtent: 250.h,
          crossAxisSpacing: 12.w,
          childAspectRatio: 164.w,
        ),
        itemBuilder: (context, index) {
          final bloodBank = BloodBanksCubit.get(context).allBloodBanks[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.medicalEquipmentDetails,
                arguments: bloodBank,
              );
            },
            child: BloodBanksProductItem(bloodBank),
          );
        },
        itemCount:
            MedicalEquipmentsCubit.get(context).allMedicalEquipments.length,
      ),
    );
  }
}
