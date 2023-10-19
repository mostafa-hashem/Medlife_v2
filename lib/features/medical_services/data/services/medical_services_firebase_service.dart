import 'package:medlife_v2/features/medical_services/data/models/medical_service.dart';

class MedicalServicesFirebaseService {
  Future<List<MedicalService>> getMedicalServices() async {
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

// class MedicalServicesFirebaseService {
//   final _medicalServicesCollection =
//       FirebaseFirestore.instance.collection(FirebasePath.medicalServices);

//   Future<List<MedicalService>> getMedicalServices() async {
//     final querySnapshot = await _medicalServicesCollection.get();
//     return querySnapshot.docs
//         .map(
//           (queryDocSnapshot) =>
//               MedicalService.fromJson(queryDocSnapshot.data()),
//         )
//         .toList();
//   }
// }
