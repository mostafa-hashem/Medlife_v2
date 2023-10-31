abstract class CartState {}

class CartInitial extends CartState {}

class AddMedicalEquipmentToCartLoading extends CartState {}

class AnotherVendorAndAddMedicalEquipmentToCartSuccess extends CartState {}

class AnotherTypeAndAddMedicalEquipmentToCartSuccess extends CartState {}

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

class AnotherProviderAndAddMedicalServiceToCartSuccess extends CartState {}

class AnotherTypeAndAddMedicalServiceToCartSuccess extends CartState {}

class AddBloodBankToCartLoading extends CartState {}

class AddBloodBankToCartSuccess extends CartState {}

class AddBloodBankToCartError extends CartState {
  final String message;

  AddBloodBankToCartError(this.message);
}

class AnotherProviderAndAddBloodBankToCartSuccess extends CartState {}

class AnotherTypeAndAddBloodBankToCartSuccess extends CartState {}

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

class EditBloodBankCartLoading extends CartState {}

class EditBloodBankCartSuccess extends CartState {}

class EditBloodBankCartError extends CartState {
  final String message;

  EditBloodBankCartError(this.message);
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

class DeleteBloodBankCartLoading extends CartState {}

class DeleteBloodBankCartSuccess extends CartState {}

class DeleteBloodBankCartError extends CartState {
  final String message;

  DeleteBloodBankCartError(this.message);
}
