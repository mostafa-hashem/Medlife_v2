import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/medical_equipment/data/models/medical_equipment.dart';
import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';
import 'package:medlife_v2/utils/constants.dart';

class MedicalServiceFirebaseService {
  Future<List<MedicalService>> getAllMedicalServices() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
      10,
      (index) => MedicalService(
        title: 'Compression device',
        description:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad',
        price: 9.98,
        rating: index.isEven ? 4.5 : 3.5,
        imagesUrls: [
          "assets/images/Frame 69.png",
        ],
        createdAt: DateTime.now(),
        providerName: 'Ahmed',
        providerRating: 4.5,
        numOfReviews: 1012,
      ),
    );
  }
}

// class MedicalEquipmentFirebaseService {
//   final _medicalEquipmentsCollection =
//       FirebaseFirestore.instance.collection(FirebasePath.medicalEquipments);
//
//   Future<List<MedicalEquipment>> getAllMedicalEquipments() async {
//     final querySnapshot = await _medicalEquipmentsCollection.get();
//     return querySnapshot.docs
//         .map(
//           (queryDocSnapshot) =>
//               MedicalEquipment.fromJson(queryDocSnapshot.data()),
//         )
//         .toList();
//   }
// }
