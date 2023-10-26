abstract class CartState {}

class CartInitial extends CartState {}

class AddMedicalEquipmentToCartLoading extends CartState {}

class AddMedicalEquipmentToCartSuccess extends CartState {}

class AddMedicalEquipmentToCartError extends CartState {
  final String message;

  AddMedicalEquipmentToCartError(this.message);
}

class AddMedicalServiceToCartLoading extends CartState {}

class AddMedicalServiceToCartSuccess extends CartState {}

class AddMedicalServiceToCartError extends CartState {
  final String message;

  AddMedicalServiceToCartError(this.message);
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  final String message;

  GetCartError(this.message);
}

class EditMedicalEquipmentCartLoading extends CartState {}

class EditMedicalEquipmentCartSuccess extends CartState {}

class EditMedicalEquipmentCartError extends CartState {
  final String message;

  EditMedicalEquipmentCartError(this.message);
}

class EditMedicalServiceCartLoading extends CartState {}

class EditMedicalServiceCartSuccess extends CartState {}

class EditMedicalServiceCartError extends CartState {
  final String message;

  EditMedicalServiceCartError(this.message);
}

class DeleteMedicalEquipmentCartLoading extends CartState {}

class DeleteMedicalEquipmentCartSuccess extends CartState {}

class DeleteMedicalEquipmentCartError extends CartState {
  final String message;

  DeleteMedicalEquipmentCartError(this.message);
}

class DeleteMedicalServiceCartLoading extends CartState {}

class DeleteMedicalServiceCartSuccess extends CartState {}

class DeleteMedicalServiceCartError extends CartState {
  final String message;

  DeleteMedicalServiceCartError(this.message);
}
