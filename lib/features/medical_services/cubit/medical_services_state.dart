abstract class MedicalServicesState {}

class MedicalServicesInitial extends MedicalServicesState {}

class GetMedicalServicesLoading extends MedicalServicesState {}

class GetMedicalServicesSuccess extends MedicalServicesState {}

class GetMedicalServicesError extends MedicalServicesState {
  final String message;

  GetMedicalServicesError(this.message);
}
