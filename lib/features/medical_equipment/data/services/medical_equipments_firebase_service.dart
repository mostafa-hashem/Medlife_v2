import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/utils/constants.dart';

class MedicalEquipmentsFirebaseService {
  final _medicalEquipmentsCollection =
      FirebaseFirestore.instance.collection(FirebasePath.medicalEquipments);

  Future<List<MedicalEquipment>> getMedicalEquipments() async {
    final querySnapshot = await _medicalEquipmentsCollection.get();
    return querySnapshot.docs
        .map(
          (queryDocSnapshot) =>
              MedicalEquipment.fromJson(queryDocSnapshot.data()),
        )
        .toList();
  }
}
