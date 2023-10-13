import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_state.dart';

class MedicalEquipmentsCubit extends Cubit<MedicalEquipmentsState> {
  static MedicalEquipmentsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  MedicalEquipmentsCubit() : super(MedicalEquipmentsInitial());
}
