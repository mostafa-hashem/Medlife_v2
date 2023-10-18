abstract class MedicalServicesState {}

class MedicalServicesInitial extends MedicalServicesState {}

class GetAllMedicalServicesLoading extends MedicalServicesState {}

class GetAllMedicalServicesSuccess extends MedicalServicesState {}

class GetAllMedicalServicesError extends MedicalServicesState {
  final String message;

  GetAllMedicalServicesError(this.message);
}

