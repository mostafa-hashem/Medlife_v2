import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/widgets/filter_bottom_sheet.dart';
import '../pages/widgets/sorting_bottom_sheet.dart';
import 'medical_equipments_states.dart';

class MedicalEquipmentsCubit extends Cubit<MedicalEquipmentsStates> {
  static MedicalEquipmentsCubit get(context) => BlocProvider.of(context);

  MedicalEquipmentsCubit() : super(MedicalEquipmentsInitial());

  void showSortingSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const SortingBottomSheet();
      },
      isScrollControlled: true,
      backgroundColor: const Color(0xff323434),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
      ),
    );
  }

  void showFilterSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const FilterBottomSheet();
      },
      isScrollControlled: true,
      backgroundColor: const Color(0xff323434),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r)),
      ),
    );
  }
}
