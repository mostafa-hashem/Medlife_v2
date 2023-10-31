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
  List<MedicalEquipment> filteredByProductTypesEquipments = [];
  List<MedicalEquipment> filteredByBrandEquipments = [];
  List<MedicalEquipment> filteredByVendorsEquipments = [];
  List<MedicalEquipment> filteredByPriceEquipments = [];

  List<String> productTypes = [];
  List<String> brands = [];
  List<String> vendors = [];
  List<String> priceRanges = ['500', '1000', '1500', '2000'];

  Future<void> getAllMedicalEquipments() async {
    emit(GetAllMedicalEquipmentsLoading());
    try {
      allMedicalEquipments =
          await _medicalEquipmentFirebaseService.getMedicalEquipments();
      emit(GetAllMedicalEquipmentsSuccess());
      _getBrands();
      _getVendors();
      _getProductTypes();
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

  void sortByHighToLowPrice() {
    final sortedEquipments = [...allMedicalEquipments];
    sortedEquipments.sort(
      (firstEquipment, secondEquipment) =>
          secondEquipment.price.compareTo(firstEquipment.price),
    );
    emit(HighToLowPriceSortedMedicalEquipments(sortedEquipments));
  }

  void sortByLowToHighPrice() {
    final sortedEquipments = [...allMedicalEquipments];
    sortedEquipments.sort(
      (firstEquipment, secondEquipment) =>
          firstEquipment.price.compareTo(secondEquipment.price),
    );
    emit(LowToHighPriceSortedMedicalEquipments(sortedEquipments));
  }

  void filterByProductType(String productType) {
    final filteredEquipments = allMedicalEquipments
        .where((equipment) => equipment.productType == productType)
        .toList();
    emit(FilteredByProductTypeMedicalEquipments(filteredEquipments));
  }

  void filterByBrand(String brandName) {
    final filteredEquipments = allMedicalEquipments
        .where((equipment) => equipment.brand == brandName)
        .toList();
    emit(FilteredByBrandMedicalEquipments(filteredEquipments));
  }

  void filterByVendor(String vendorName) {
    final filteredEquipments = allMedicalEquipments
        .where((equipment) => equipment.vendorName == vendorName)
        .toList();
    emit(FilteredByVendorMedicalEquipments(filteredEquipments));
  }

  void filterByPrice(double price) {
    final filteredEquipments = allMedicalEquipments
        .where((equipment) => equipment.price < price)
        .toList();
    emit(FilteredByPriceMedicalEquipments(filteredEquipments));
  }

  void _getBrands() => brands =
      allMedicalEquipments.map((equipment) => equipment.brand).toSet().toList();

  void _getVendors() => vendors = allMedicalEquipments
      .map((equipment) => equipment.vendorName)
      .toSet()
      .toList();

  void _getProductTypes() => productTypes = allMedicalEquipments
      .map((equipment) => equipment.productType)
      .toSet()
      .toList();
}
