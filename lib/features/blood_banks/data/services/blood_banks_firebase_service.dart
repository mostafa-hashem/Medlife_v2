import 'package:medlife_v2/features/blood_banks/data/models/blood_bank.dart';

class BloodBanksFirebaseService {
  Future<List<BloodBank>> getBloodBanks() async {
    await Future.delayed(const Duration(seconds: 1));
    return List.generate(
      10,
      (index) => BloodBank(
        title: 'Compression device',
        description:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad',
        price: 9.98,
        imagesUrls: [
          "assets/images/Frame 69.png",
        ],
        createdAt: DateTime.now(),
        providerName: 'Ahmed',
        numOfReviews: 1012,
      ),
    );
  }
}

// class BloodBanksFirebaseService {
//   final _bloodBanksCollection =
//       FirebaseFirestore.instance.collection(FirebasePath.bloodBanks);
//
//   Future<List<BloodBank>> getBloodBanks() async {
//     final querySnapshot = await _bloodBanksCollection.get();
//     return querySnapshot.docs
//         .map(
//           (queryDocSnapshot) => BloodBank.fromJson(queryDocSnapshot.data()),
//         )
//         .toList();
//   }
// }
