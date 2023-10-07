import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_states.dart';
import 'package:medlife_v2/features/medical_equipment/pages/widgets/filter_bottom_sheet.dart';
import 'package:medlife_v2/features/medical_equipment/pages/widgets/sorting_bottom_sheet.dart';

class MedicalEquipmentsCubit extends Cubit<MedicalEquipmentsStates> {
  static MedicalEquipmentsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  MedicalEquipmentsCubit() : super(MedicalEquipmentsInitial());

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
