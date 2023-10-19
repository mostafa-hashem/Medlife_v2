import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/cart/cubit/cart_state.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_order.dart';
import 'package:medlife_v2/features/cart/data/services/cart_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(BuildContext context) => BlocProvider.of(context);

  final _cartFirebaseService = CartFirebaseService();
  List<CartMedicalEquipment> cartMedicalEquipments = [];

  Future<void> addToCart(CartOrder cartOrder) async {
    emit(AddToCartLoading());
    try {
      await _cartFirebaseService.addToCart(cartOrder);
      emit(AddToCartSuccess());
    } catch (e) {
      emit(AddToCartError(Failure.fromException(e).message));
    }
  }

  Future<void> getCart() async {
    emit(GetCartLoading());
    try {
      final cart = await _cartFirebaseService.getCart();
      cartMedicalEquipments = [];
      cartMedicalEquipments.addAll(cart.cartMedicalEquipments);
      emit(GetCartSuccess());
    } catch (e) {
      emit(GetCartError(Failure.fromException(e).message));
    }
  }

  Future<void> editCart(CartOrder cartOrder) async {
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
    emit(EditCartLoading());
    try {
      await _cartFirebaseService.editCart(cartOrder);
      emit(EditCartSuccess());
    } catch (e) {
      emit(EditCartError(Failure.fromException(e).message));
    }
  }

  Future<void> deleteFromCart(String medicalEquipmentId) async {
    cartMedicalEquipments.removeWhere(
      (cartMedicalEquipment) =>
          cartMedicalEquipment.medicalEquipment.id == medicalEquipmentId,
    );
    emit(DeleteCartLoading());
    try {
      await _cartFirebaseService.deleteFromCart(medicalEquipmentId);
      emit(DeleteCartSuccess());
    } catch (e) {
      emit(DeleteCartError(Failure.fromException(e).message));
    }
  }
}
