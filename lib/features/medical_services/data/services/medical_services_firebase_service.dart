import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';
import 'package:medlife_v2/utils/constants.dart';

class MedicalServicesFirebaseService {
  final _medicalServicesCollection =
      FirebaseFirestore.instance.collection(FirebasePath.medicalServices);

  Future<List<MedicalService>> getMedicalServices() async {
    final querySnapshot = await _medicalServicesCollection.get();
    return querySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              MedicalService.fromJson(queryDocSnapshot.data()),
        )
        .toList();
  }
}
