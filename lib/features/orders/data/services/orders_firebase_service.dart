import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/utils/constants.dart';

class OrdersFirebaseService {
  final _userOrdersCollection = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.orders);
  final _medicalEquipmentsCartCollection = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.medicalEquipmentsCart);
  final _medicalServicesCartCollection = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.medicalServicesCart);
  final _ordersCollection = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.orders);

  Future<void> createOrder(Order order) async {
    final docRef = _userOrdersCollection.doc();
    order.id = docRef.id;
    await docRef.set(order.toJson());

    FirebaseFirestore.instance
        .collection(FirebasePath.vendors)
        .doc(order.vendorId)
        .collection(FirebasePath.orders)
        .doc(order.id)
        .set(order.toJson());

    final equipmentsCartQuerySnapshot =
        await _medicalEquipmentsCartCollection.get();
    await Future.forEach(
      equipmentsCartQuerySnapshot.docs,
      (queryDocSnapshot) async => queryDocSnapshot.reference.delete(),
    );
    final servicesCartQuerySnapshot =
        await _medicalServicesCartCollection.get();
    await Future.forEach(
      servicesCartQuerySnapshot.docs,
      (queryDocSnapshot) async => queryDocSnapshot.reference.delete(),
    );
  }

  Future<List<Order>> getOrders() async {
    final querySnapshot = await _ordersCollection.get();
    final orders = querySnapshot.docs
        .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
        .toList();
    orders.sort(
          (order, nextOrder) => nextOrder.dateTime!.compareTo(order.dateTime!),
    );
    return orders;
  }

  Future<void> cancelOrder(String orderId) async =>
      _ordersCollection.doc(orderId).update({
        FirebasePath.status: 'Canceled',
      });
}
