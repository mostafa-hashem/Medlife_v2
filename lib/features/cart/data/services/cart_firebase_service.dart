import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlife_v2/features/cart/data/models/cart.dart';
import 'package:medlife_v2/features/cart/data/models/cart_medical_equipment.dart';
import 'package:medlife_v2/features/cart/data/models/cart_order.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/utils/constants.dart';

class CartFirebaseService {
  final _cartCollection = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection(FirebasePath.cart);

  final _medicalEquipmentsCollection =
      FirebaseFirestore.instance.collection(FirebasePath.medicalEquipments);

  Future<void> addToCart(CartOrder cartOrder) async {
    final cartQuerySnapshot = await _cartCollection.get();
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
        final docSnapshot =
            await _cartCollection.doc(cartOrder.medicalEquipmentId).get();
        final quantity = docSnapshot.data()![FirebasePath.quantity] as num;
        return  _cartCollection.doc(cartOrder.medicalEquipmentId).update({
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
    await _cartCollection
        .doc(cartOrder.medicalEquipmentId)
        .set(cartMedicalEquipment.toJson());
  }

  Future<Cart> getCart() async {
    final querySnapshot = await _cartCollection.get();
    final cartMedicalEquipments = querySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              CartMedicalEquipment.fromJson(queryDocSnapshot.data()),
        )
        .toList();
    return Cart(cartMedicalEquipments: cartMedicalEquipments);
  }

  Future<void> editCart(CartOrder cartOrder) async {
    await _cartCollection
        .doc(cartOrder.medicalEquipmentId)
        .update(cartOrder.toJson());
  }

  Future<void> deleteFromCart(String medicalEquipmentId) async {
    await _cartCollection.doc(medicalEquipmentId).delete();
  }
}
