import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_services/cubit/medical_services_cubit.dart';
import 'package:medlife_v2/features/medical_services/ui/widgets/medical_services_product_item.dart';
import 'package:medlife_v2/route_manager.dart';

class MedicalServicesProductsList extends StatelessWidget {
  const MedicalServicesProductsList();

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
          final medicalServices =
              MedicalServicesCubit.get(context).medicalServices[index];
          return InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.medicalServiceDetails,
                arguments: medicalServices,
              );
            },
            child: MedicalServicesProductItem(medicalServices),
          );
        },
        itemCount: MedicalServicesCubit.get(context).medicalServices.length,
      ),
    );
  }
}
