abstract class MedicalEquipmentsState {}

class MedicalEquipmentsInitial extends MedicalEquipmentsState {}

class MedicalEquipmentsLoading extends MedicalEquipmentsState {}

class MedicalEquipmentsSuccess extends MedicalEquipmentsState {
  final String userId;

  MedicalEquipmentsSuccess(this.userId);
}

class MedicalEquipmentsError extends MedicalEquipmentsState {
  final String error;

  MedicalEquipmentsError(this.error);
}

class HomeInitial extends MedicalEquipmentsState {}

class HomeConnectedState extends MedicalEquipmentsState {}

class HomeNotConnectedState extends MedicalEquipmentsState {}
