import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/medical_services/cubit/medical_services_state.dart';
import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';
import 'package:medlife_v2/features/medical_services/data/services/medical_services_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class MedicalServicesCubit extends Cubit<MedicalServicesState> {
  MedicalServicesCubit() : super(MedicalServicesInitial());

  static MedicalServicesCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final _medicalServiceFirebaseService = MedicalServicesFirebaseService();
  List<MedicalService> medicalServices = [];

  Future<void> getMedicalServices() async {
    emit(GetMedicalServicesLoading());
    try {
      medicalServices =
          await _medicalServiceFirebaseService.getMedicalServices();
      emit(GetMedicalServicesSuccess());
    } catch (e) {
      emit(
        GetMedicalServicesError(
          Failure.fromException(e).message,
        ),
      );
    }
  }
}
