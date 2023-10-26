import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/cart/cubit/cart_state.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/cart/data/models/medical_equipment_cart_order.dart';
import 'package:medlife_v2/features/cart/data/models/medical_service_cart_order.dart';
import 'package:medlife_v2/features/cart/data/services/cart_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  final _cartFirebaseService = CartFirebaseService();
  List<CartMedicalEquipment> cartMedicalEquipments = [];
  List<CartMedicalService> cartMedicalServices = [];

  Future<void> addMedicalEquipmentToCart(
    MedicalEquipmentCartOrder cartOrder,
  ) async {
    emit(AddMedicalEquipmentToCartLoading());
    try {
      await _cartFirebaseService.addMedicalEquipmentToCart(cartOrder);
      emit(AddMedicalEquipmentToCartSuccess());
    } catch (e) {
      emit(AddMedicalEquipmentToCartError(Failure.fromException(e).message));
    }
  }

  Future<void> addMedicalServiceToCart(
    MedicalServiceCartOrder cartOrder,
  ) async {
    emit(AddMedicalServiceToCartLoading());
    try {
      await _cartFirebaseService.addMedicalServiceToCart(cartOrder);
      emit(AddMedicalServiceToCartSuccess());
    } catch (e) {
      emit(AddMedicalServiceToCartError(Failure.fromException(e).message));
    }
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    try {
      final cart = await _cartFirebaseService.getCart();
      cartMedicalEquipments = [];
      cartMedicalEquipments.addAll(cart.cartMedicalEquipments);
      cartMedicalServices = [];
      cartMedicalServices.addAll(cart.cartMedicalServices);
      emit(GetCartSuccess());
    } catch (e) {
      emit(GetCartError(Failure.fromException(e).message));
    }
  }

  Future<void> editMedicalEquipmentsCart(
    MedicalEquipmentCartOrder cartOrder,
  ) async {
    final index = cartMedicalEquipments.indexWhere(
      (cartMedicalEquipment) =>
          cartMedicalEquipment.medicalEquipment.id ==
          cartOrder.medicalEquipmentId,
    );
    final editedCartMedicalEquipment = CartMedicalEquipment(
      medicalEquipment: cartMedicalEquipments
          .singleWhere(
            (cartMedicalEquipment) =>
                cartMedicalEquipment.medicalEquipment.id ==
                cartOrder.medicalEquipmentId,
          )
          .medicalEquipment,
      quantity: cartOrder.quantity,
    );
    cartMedicalEquipments[index] = editedCartMedicalEquipment;
    emit(EditMedicalEquipmentCartLoading());
    try {
      await _cartFirebaseService.editMedicalEquipmentsCart(cartOrder);
      emit(EditMedicalEquipmentCartSuccess());
    } catch (e) {
      emit(EditMedicalEquipmentCartError(Failure.fromException(e).message));
    }
  }

  Future<void> editMedicalServicesCart(
    MedicalServiceCartOrder cartOrder,
  ) async {
    final index = cartMedicalServices.indexWhere(
      (cartMedicalService) =>
          cartMedicalService.medicalService.id == cartOrder.medicalServiceId,
    );
    final editedCartMedicalService = CartMedicalService(
      medicalService: cartMedicalServices
          .singleWhere(
            (cartMedicalService) =>
                cartMedicalService.medicalService.id ==
                cartOrder.medicalServiceId,
          )
          .medicalService,
      quantity: cartOrder.quantity,
    );
    cartMedicalServices[index] = editedCartMedicalService;
    emit(EditMedicalServiceCartLoading());
    try {
      await _cartFirebaseService.editMedicalServicesCart(cartOrder);
      emit(EditMedicalServiceCartSuccess());
    } catch (e) {
      emit(EditMedicalServiceCartError(Failure.fromException(e).message));
    }
  }

  Future<void> deleteFromMedicalEquipmentsCart(
    String medicalEquipmentId,
  ) async {
    cartMedicalEquipments.removeWhere(
      (cartMedicalEquipment) =>
          cartMedicalEquipment.medicalEquipment.id == medicalEquipmentId,
    );
    emit(DeleteMedicalEquipmentCartLoading());
    try {
      await _cartFirebaseService
          .deleteFromMedicalEquipmentsCart(medicalEquipmentId);
      emit(DeleteMedicalEquipmentCartSuccess());
    } catch (e) {
      emit(DeleteMedicalEquipmentCartError(Failure.fromException(e).message));
    }
  }

  Future<void> deleteFromMedicalServicesCart(
    String medicalServiceId,
  ) async {
    cartMedicalServices.removeWhere(
      (cartMedicalService) =>
          cartMedicalService.medicalService.id == medicalServiceId,
    );
    emit(DeleteMedicalServiceCartLoading());
    try {
      await _cartFirebaseService
          .deleteFromMedicalServicesCart(medicalServiceId);
      emit(DeleteMedicalServiceCartSuccess());
    } catch (e) {
      emit(DeleteMedicalServiceCartError(Failure.fromException(e).message));
    }
  }
}
