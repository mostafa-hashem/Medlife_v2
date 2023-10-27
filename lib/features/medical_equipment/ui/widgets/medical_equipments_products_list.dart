import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_cubit.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_state.dart';
import 'package:medlife_v2/features/medical_equipment/ui/widgets/medical_equipments_grid_view.dart';

class MedicalEquipmentsProductsList extends StatelessWidget {
  const MedicalEquipmentsProductsList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicalEquipmentsCubit, MedicalEquipmentsState>(
      builder: (context, state) {
        if (state is HighToLowPriceSortedMedicalEquipments) {
          return MedicalEquipmentsGridView(state.sortedEquipments);
        } else if (state is LowToHighPriceSortedMedicalEquipments) {
          return MedicalEquipmentsGridView(state.sortedEquipments);
        } else {
          return MedicalEquipmentsGridView(
            MedicalEquipmentsCubit.get(context).allMedicalEquipments,
          );
        }
      },
    );
  }
}
