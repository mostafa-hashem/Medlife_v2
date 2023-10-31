import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/cart/cubit/cart_state.dart';
import 'package:medlife_v2/features/cart/data/models/blood_bank_cart_order.dart';
import 'package:medlife_v2/features/cart/data/models/cart_blood_bank.dart';
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
  List<CartBloodBank> cartBloodBanks = [];

  Future<void> addMedicalEquipmentToCart(
    MedicalEquipmentCartOrder cartOrder,
  ) async {
    emit(AddMedicalEquipmentToCartLoading());
    try {
      if (cartMedicalEquipments.isNotEmpty &&
          cartMedicalEquipments
              .where(
                (cartEquipment) =>
                    cartEquipment.medicalEquipment.vendorId !=
                    cartOrder.vendorId,
              )
              .isNotEmpty) {
        await _cartFirebaseService.emptyMedicalEquipmentsCart();
        await _cartFirebaseService.addMedicalEquipmentToCart(cartOrder);
        emit(AnotherVendorAndAddMedicalEquipmentToCartSuccess());
      } else if (cartMedicalServices.isNotEmpty || cartBloodBanks.isNotEmpty) {
        await _cartFirebaseService.emptyMedicalServicesCart();
        await _cartFirebaseService.emptyBloodBanksCart();
        await _cartFirebaseService.addMedicalEquipmentToCart(cartOrder);
        emit(AnotherTypeAndAddMedicalEquipmentToCartSuccess());
      } else {
        await _cartFirebaseService.addMedicalEquipmentToCart(cartOrder);
        emit(AddMedicalEquipmentToCartSuccess());
      }
    } catch (e) {
      emit(AddMedicalEquipmentToCartError(Failure.fromException(e).message));
    }
  }

  Future<void> addMedicalServiceToCart(
    MedicalServiceCartOrder cartOrder,
  ) async {
    emit(AddMedicalServiceToCartLoading());
    try {
      if (cartMedicalServices.isNotEmpty &&
          cartMedicalServices
              .where(
                (cartService) =>
                    cartService.medicalService.providerId !=
                    cartOrder.providerId,
              )
              .isNotEmpty) {
        await _cartFirebaseService.emptyMedicalServicesCart();
        await _cartFirebaseService.addMedicalServiceToCart(cartOrder);
        emit(AnotherProviderAndAddMedicalServiceToCartSuccess());
      } else if (cartMedicalEquipments.isNotEmpty ||
          cartBloodBanks.isNotEmpty) {
        await _cartFirebaseService.emptyMedicalEquipmentsCart();
        await _cartFirebaseService.emptyBloodBanksCart();
        await _cartFirebaseService.addMedicalServiceToCart(cartOrder);
        emit(AnotherTypeAndAddMedicalServiceToCartSuccess());
      } else {
        await _cartFirebaseService.addMedicalServiceToCart(cartOrder);
        emit(AddMedicalServiceToCartSuccess());
      }
    } catch (e) {
      emit(AddMedicalServiceToCartError(Failure.fromException(e).message));
    }
  }

  Future<void> addBloodBankToCart(
    BloodBankCartOrder cartOrder,
  ) async {
    emit(AddBloodBankToCartLoading());
    try {
      if (cartBloodBanks.isNotEmpty &&
          cartBloodBanks
              .where(
                (cartBloodBank) =>
                    cartBloodBank.bloodBank.providerId != cartOrder.providerId,
              )
              .isNotEmpty) {
        await _cartFirebaseService.emptyBloodBanksCart();
        await _cartFirebaseService.addBloodBankToCart(cartOrder);
        emit(AnotherProviderAndAddBloodBankToCartSuccess());
      } else if (cartMedicalEquipments.isNotEmpty ||
          cartMedicalServices.isNotEmpty) {
        await _cartFirebaseService.emptyMedicalEquipmentsCart();
        await _cartFirebaseService.emptyMedicalServicesCart();
        await _cartFirebaseService.addBloodBankToCart(cartOrder);
        emit(AnotherTypeAndAddBloodBankToCartSuccess());
      } else {
        await _cartFirebaseService.addBloodBankToCart(cartOrder);
        emit(AddBloodBankToCartSuccess());
      }
    } catch (e) {
      emit(AddBloodBankToCartError(Failure.fromException(e).message));
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
      cartBloodBanks = [];
      cartBloodBanks.addAll(cart.cartBloodBanks);
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

  Future<void> editBloodBanksCart(
    BloodBankCartOrder cartOrder,
  ) async {
    final index = cartBloodBanks.indexWhere(
      (cartBloodBank) => cartBloodBank.bloodBank.id == cartOrder.bloodBankId,
    );
    final editedCartBloodBank = CartBloodBank(
      bloodBank: cartBloodBanks
          .singleWhere(
            (cartBloodBank) =>
                cartBloodBank.bloodBank.id == cartOrder.bloodBankId,
          )
          .bloodBank,
      quantity: cartOrder.quantity,
    );
    cartBloodBanks[index] = editedCartBloodBank;
    emit(EditBloodBankCartLoading());
    try {
      await _cartFirebaseService.editBloodBanksCart(cartOrder);
      emit(EditBloodBankCartSuccess());
    } catch (e) {
      emit(EditBloodBankCartError(Failure.fromException(e).message));
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

  Future<void> deleteFromBloodBanksCart(
    String bloodBankId,
  ) async {
    cartBloodBanks.removeWhere(
      (cartBloodBank) => cartBloodBank.bloodBank.id == bloodBankId,
    );
    emit(DeleteBloodBankCartLoading());
    try {
      await _cartFirebaseService.deleteFromBloodBanksCart(bloodBankId);
      emit(DeleteBloodBankCartSuccess());
    } catch (e) {
      emit(DeleteBloodBankCartError(Failure.fromException(e).message));
    }
  }
}
