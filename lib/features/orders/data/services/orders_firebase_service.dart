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
  final _usesOrdersCollection = FirebaseFirestore.instance
      .collection(FirebasePath.users)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection(FirebasePath.orders);
  final _vendorsOrdersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.vendors);

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

  Future<List<Order>> getUserOrders() async {
    final querySnapshot = await _usesOrdersCollection.get();
    final orders = querySnapshot.docs
        .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
        .toList();
    orders.sort(
      (order, nextOrder) => nextOrder.dateTime!.compareTo(order.dateTime!),
    );
    return orders;
  }

  Future<List<Order>> getVendorOrders() async {
    final querySnapshot = await _vendorsOrdersCollection.get();
    final orders = querySnapshot.docs
        .map((queryDocSnapshot) => Order.fromJson(queryDocSnapshot.data()))
        .toList();
    orders.sort(
      (order, nextOrder) => nextOrder.dateTime!.compareTo(order.dateTime!),
    );
    return orders;
  }

  Future<void> cancelOrder(String orderId, String vendorId) async {
    _usesOrdersCollection.doc(orderId).update({
      FirebasePath.status: 'Canceled',
    }).whenComplete(() =>
    _vendorsOrdersCollection
        .doc(vendorId)
        .collection(FirebasePath.orders)
        .doc(orderId)
        .update({
      FirebasePath.status: 'Canceled',
    }),);
  }
}
