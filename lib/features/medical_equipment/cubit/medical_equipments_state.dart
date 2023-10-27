import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';

abstract class MedicalEquipmentsState {}

class MedicalEquipmentsInitial extends MedicalEquipmentsState {}

class GetAllMedicalEquipmentsLoading extends MedicalEquipmentsState {}

class GetAllMedicalEquipmentsSuccess extends MedicalEquipmentsState {}

class GetAllMedicalEquipmentsError extends MedicalEquipmentsState {
  final String message;

  GetAllMedicalEquipmentsError(this.message);
}

class GetTopRatedMedicalEquipmentsLoading extends MedicalEquipmentsState {}

class GetTopRatedMedicalEquipmentsSuccess extends MedicalEquipmentsState {}

class GetTopRatedMedicalEquipmentsError extends MedicalEquipmentsState {
  final String message;

  GetTopRatedMedicalEquipmentsError(this.message);
}

class GetMostRecommendedMedicalEquipmentsLoading
    extends MedicalEquipmentsState {}

class GetMostRecommendedMedicalEquipmentsSuccess
    extends MedicalEquipmentsState {}

class GetMostRecommendedMedicalEquipmentsError extends MedicalEquipmentsState {
  final String message;

  GetMostRecommendedMedicalEquipmentsError(this.message);
}

class GetRecentlyAddedMedicalEquipmentsLoading extends MedicalEquipmentsState {}

class GetRecentlyAddedMedicalEquipmentsSuccess extends MedicalEquipmentsState {}

class GetRecentlyAddedMedicalEquipmentsError extends MedicalEquipmentsState {
  final String message;

  GetRecentlyAddedMedicalEquipmentsError(this.message);
}

class HighToLowPriceSortedMedicalEquipments extends MedicalEquipmentsState {
  final List<MedicalEquipment> sortedEquipments;

  HighToLowPriceSortedMedicalEquipments(this.sortedEquipments);
}

class LowToHighPriceSortedMedicalEquipments extends MedicalEquipmentsState {
  final List<MedicalEquipment> sortedEquipments;

  LowToHighPriceSortedMedicalEquipments(this.sortedEquipments);
}

class FilteredByProductTypeMedicalEquipments extends MedicalEquipmentsState {
  final List<MedicalEquipment> filteredEquipments;

  FilteredByProductTypeMedicalEquipments(this.filteredEquipments);
}

class FilteredByBrandMedicalEquipments extends MedicalEquipmentsState {
  final List<MedicalEquipment> filteredEquipments;

  FilteredByBrandMedicalEquipments(this.filteredEquipments);
}

class FilteredByVendorMedicalEquipments extends MedicalEquipmentsState {
  final List<MedicalEquipment> filteredEquipments;

  FilteredByVendorMedicalEquipments(this.filteredEquipments);
}

class FilteredByPriceMedicalEquipments extends MedicalEquipmentsState {
  final List<MedicalEquipment> filteredEquipments;

  FilteredByPriceMedicalEquipments(this.filteredEquipments);
}
