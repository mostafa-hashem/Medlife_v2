abstract class MedicalEquipmentsStates {}

class MedicalEquipmentsInitial extends MedicalEquipmentsStates {}

class MedicalEquipmentsLoading extends MedicalEquipmentsStates {}

class MedicalEquipmentsSuccess extends MedicalEquipmentsStates {
  final String userId;

  MedicalEquipmentsSuccess(this.userId);
}

class MedicalEquipmentsFailure extends MedicalEquipmentsStates {
  final String error;

  MedicalEquipmentsFailure(this.error);
}