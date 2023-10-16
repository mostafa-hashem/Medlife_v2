import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_cubit.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_state.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/medical_equipments_product_item.dart';
import 'package:medlife_v2/route_manager.dart';

class MedicalEquipmentsProductsList extends StatelessWidget {
  const MedicalEquipmentsProductsList();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MedicalEquipmentsCubit, MedicalEquipmentsState>(
      listener: (_, state) {
        if (state is GetAllMedicalEquipmentsSuccess) {
          MedicalEquipmentsCubit.get(context).getTopRatedMedicalEquipments();
          MedicalEquipmentsCubit.get(context)
              .getMostRecommendedMedicalEquipments();
          MedicalEquipmentsCubit.get(context)
              .getRecentlyAddedMedicalEquipments();
        }
      },
      buildWhen: (_, currentState) =>
          currentState is GetTopRatedMedicalEquipmentsLoading ||
          currentState is GetTopRatedMedicalEquipmentsError ||
          currentState is GetTopRatedMedicalEquipmentsSuccess,
      builder: (context, state) => Expanded(
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
            final medicalEquipment = MedicalEquipmentsCubit.get(context)
                .topRatedMedicalEquipments[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.medicalEquipmentDetails,
                  arguments: medicalEquipment,
                );
              },
              child: MedicalEquipmentsProductItem(medicalEquipment),
            );
          },
          itemCount:
              MedicalEquipmentsCubit.get(context).allMedicalEquipments.length,
        ),
      ),
    );
  }
}
