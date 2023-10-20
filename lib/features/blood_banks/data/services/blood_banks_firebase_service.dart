import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medlife_v2/features/blood_banks/data/models/blood_bank.dart';
import 'package:medlife_v2/utils/constants.dart';

class BloodBanksFirebaseService {
  final _bloodBanksCollection =
      FirebaseFirestore.instance.collection(FirebasePath.bloodBanks);

  Future<List<BloodBank>> getBloodBanks() async {
    final querySnapshot = await _bloodBanksCollection.get();
    return querySnapshot.docs
        .map(
          (queryDocSnapshot) => BloodBank.fromJson(queryDocSnapshot.data()),
        )
        .toList();
  }
}
