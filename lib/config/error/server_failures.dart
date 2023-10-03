import 'failures.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFailures extends Failures {
  FirebaseFailures(super.message);

  factory FirebaseFailures.fromException(dynamic e) {
    if (e is FirebaseAuthException) {
      return handleFirebaseAuthException(e);
    } else {
      return FirebaseFailures('Unknown Firebase error: ${e.toString()}');
    }
  }

  static FirebaseFailures handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return FirebaseFailures('User not found');
      case 'wrong-password':
        return FirebaseFailures('Wrong password or Email');
      case 'email-already-in-use':
        return FirebaseFailures('Email is already in use');
      case 'invalid-email':
        return FirebaseFailures('Invalid email address');
      case 'weak-password':
        return FirebaseFailures('Password is too weak');
      default:
        return FirebaseFailures('Firebase Auth error: ${e.message}');
    }
  }
}
