import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_state.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/medical_equipment/data/services/medical_equipments_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class MedicalEquipmentsCubit extends Cubit<MedicalEquipmentsState> {
  MedicalEquipmentsCubit() : super(MedicalEquipmentsInitial());

  static MedicalEquipmentsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final _medicalEquipmentFirebaseService = MedicalEquipmentsFirebaseService();
  List<MedicalEquipment> allMedicalEquipments = [];
  List<MedicalEquipment> topRatedMedicalEquipments = [];
  List<MedicalEquipment> mostRecommendedMedicalEquipments = [];
  List<MedicalEquipment> recentlyAddedMedicalEquipments = [];

  Future<void> getAllMedicalEquipments() async {
    emit(GetAllMedicalEquipmentsLoading());
    try {
      allMedicalEquipments =
          await _medicalEquipmentFirebaseService.getMedicalEquipments();
      emit(GetAllMedicalEquipmentsSuccess());
    } catch (e) {
      emit(GetAllMedicalEquipmentsError(Failure.fromException(e).message));
    }
  }

  Future<void> getTopRatedMedicalEquipments() async {
    emit(GetTopRatedMedicalEquipmentsLoading());
    try {
      topRatedMedicalEquipments = allMedicalEquipments;
      emit(GetTopRatedMedicalEquipmentsSuccess());
    } catch (e) {
      emit(GetTopRatedMedicalEquipmentsError(Failure.fromException(e).message));
    }
  }

  Future<void> getMostRecommendedMedicalEquipments() async {
    emit(GetMostRecommendedMedicalEquipmentsLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      mostRecommendedMedicalEquipments = allMedicalEquipments;
      emit(GetMostRecommendedMedicalEquipmentsSuccess());
    } catch (e) {
      emit(
        GetMostRecommendedMedicalEquipmentsError(
          Failure.fromException(e).message,
        ),
      );
    }
  }

  Future<void> getRecentlyAddedMedicalEquipments() async {
    emit(GetRecentlyAddedMedicalEquipmentsLoading());
    try {
      await Future.delayed(const Duration(seconds: 1));
      recentlyAddedMedicalEquipments = allMedicalEquipments;
      emit(GetRecentlyAddedMedicalEquipmentsSuccess());
    } catch (e) {
      emit(
        GetRecentlyAddedMedicalEquipmentsError(
          Failure.fromException(e).message,
        ),
      );
    }
  }
}
