import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlife_v2/features/cart/data/models/cart.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_service.dart';
import 'package:medlife_v2/features/cart/data/models/medical_equipment_cart_order.dart';
import 'package:medlife_v2/features/cart/data/models/medical_service_cart_order.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';
import 'package:medlife_v2/utils/constants.dart';

class CartFirebaseService {
  final _medicalEquipmentsCart = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection(FirebasePath.medicalEquipmentsCart);
  final _medicalServicesCart = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection(FirebasePath.medicalServicesCart);
  final _medicalEquipmentsCollection =
      FirebaseFirestore.instance.collection(FirebasePath.medicalEquipments);
  final _medicalServicesCollection =
      FirebaseFirestore.instance.collection(FirebasePath.medicalServices);

  Future<void> addMedicalEquipmentToCart(
    MedicalEquipmentCartOrder cartOrder,
  ) async {
    final cartQuerySnapshot = await _medicalEquipmentsCart.get();
    final cartMedicalEquipments = cartQuerySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              CartMedicalEquipment.fromJson(queryDocSnapshot.data()),
        )
        .toList();
    if (cartMedicalEquipments.isNotEmpty) {
      bool medicalEquipmentExistInCart = false;

      await Future.forEach(cartMedicalEquipments, (cartMedicalEquipment) async {
        if (cartMedicalEquipment.medicalEquipment.id ==
            cartOrder.medicalEquipmentId) {
          medicalEquipmentExistInCart = true;
        }
      });

      if (medicalEquipmentExistInCart) {
        final docSnapshot = await _medicalEquipmentsCart
            .doc(cartOrder.medicalEquipmentId)
            .get();
        final quantity = docSnapshot.data()![FirebasePath.quantity] as num;
        return _medicalEquipmentsCart.doc(cartOrder.medicalEquipmentId).update({
          FirebasePath.quantity: quantity + cartOrder.quantity,
        });
      }
    }
    final docSnapshot = await _medicalEquipmentsCollection
        .doc(cartOrder.medicalEquipmentId)
        .get();
    final medicalEquipment = MedicalEquipment.fromJson(docSnapshot.data()!);
    final cartMedicalEquipment = CartMedicalEquipment(
      medicalEquipment: medicalEquipment,
      quantity: cartOrder.quantity,
    );
    await _medicalEquipmentsCart
        .doc(cartOrder.medicalEquipmentId)
        .set(cartMedicalEquipment.toJson());
  }

  Future<void> addMedicalServiceToCart(
    MedicalServiceCartOrder cartOrder,
  ) async {
    final cartQuerySnapshot = await _medicalServicesCart.get();
    final cartMedicalServices = cartQuerySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              CartMedicalService.fromJson(queryDocSnapshot.data()),
        )
        .toList();
    if (cartMedicalServices.isNotEmpty) {
      bool medicalServiceExistInCart = false;

      await Future.forEach(cartMedicalServices, (cartMedicalService) async {
        if (cartMedicalService.medicalService.id ==
            cartOrder.medicalServiceId) {
          medicalServiceExistInCart = true;
        }
      });

      if (medicalServiceExistInCart) {
        final docSnapshot =
            await _medicalServicesCart.doc(cartOrder.medicalServiceId).get();
        final quantity = docSnapshot.data()![FirebasePath.quantity] as num;
        return _medicalServicesCart.doc(cartOrder.medicalServiceId).update({
          FirebasePath.quantity: quantity + cartOrder.quantity,
        });
      }
    }
    final docSnapshot =
        await _medicalServicesCollection.doc(cartOrder.medicalServiceId).get();
    final medicalService = MedicalService.fromJson(docSnapshot.data()!);
    final cartMedicalService = CartMedicalService(
      medicalService: medicalService,
      quantity: cartOrder.quantity,
    );
    await _medicalServicesCart
        .doc(cartOrder.medicalServiceId)
        .set(cartMedicalService.toJson());
  }

  Future<Cart> getCart() async {
    final equipmentsQuerySnapshot = await _medicalEquipmentsCart.get();
    final cartMedicalEquipments = equipmentsQuerySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              CartMedicalEquipment.fromJson(queryDocSnapshot.data()),
        )
        .toList();

    final servicesQuerySnapshot = await _medicalServicesCart.get();
    final cartMedicalServices = servicesQuerySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              CartMedicalService.fromJson(queryDocSnapshot.data()),
        )
        .toList();

    return Cart(
      cartMedicalEquipments: cartMedicalEquipments,
      cartMedicalServices: cartMedicalServices,
    );
  }

  Future<void> editMedicalEquipmentsCart(
    MedicalEquipmentCartOrder cartOrder,
  ) async {
    await _medicalEquipmentsCart
        .doc(cartOrder.medicalEquipmentId)
        .update(cartOrder.toJson());
  }

  Future<void> editMedicalServicesCart(
    MedicalServiceCartOrder cartOrder,
  ) async {
    await _medicalServicesCart
        .doc(cartOrder.medicalServiceId)
        .update(cartOrder.toJson());
  }

  Future<void> deleteFromMedicalEquipmentsCart(
    String medicalEquipmentId,
  ) async {
    await _medicalEquipmentsCart.doc(medicalEquipmentId).delete();
  }

  Future<void> deleteFromMedicalServicesCart(String medicalServiceId) async {
    await _medicalServicesCart.doc(medicalServiceId).delete();
  }
}
