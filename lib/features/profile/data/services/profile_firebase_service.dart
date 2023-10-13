import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:medlife_v2/utils/constants.dart';
import 'package:medlife_v2/utils/data/models/user.dart';

class ProfileFirebaseService {
  final _usersCollection =
      FirebaseFirestore.instance.collection(FirebasePath.users);

  Future<User> getUser() async {
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final docSnapshot = await _usersCollection.doc(currentUserId).get();
    return User.fromJson(docSnapshot.data()!);
  }
}
