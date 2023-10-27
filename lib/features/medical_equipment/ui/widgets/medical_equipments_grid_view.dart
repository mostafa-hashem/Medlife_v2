import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/medical_equipment_item.dart';
import 'package:medlife_v2/route_manager.dart';

class MedicalEquipmentsGridView extends StatelessWidget {
  const MedicalEquipmentsGridView(this.medicalEquipments);

  final List<MedicalEquipment> medicalEquipments;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.h,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.3,
          crossAxisSpacing: 12.w,
          childAspectRatio: 164.w,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.medicalEquipmentDetails,
                arguments: medicalEquipments[index],
              );
            },
            child: MedicalEquipmentItem(medicalEquipments[index]),
          );
        },
        itemCount: medicalEquipments.length,
      ),
    );
  }
}
