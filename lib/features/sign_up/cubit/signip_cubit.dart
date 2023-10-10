// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medlife_v2/cubit/base_cubit.dart';
// import 'package:medlife_v2/features/auth/data/models/user.dart';
// import 'package:medlife_v2/features/sign_up/cubit/signup_states.dart';
// import 'package:medlife_v2/route_manager.dart';
//
// class SignUpCubit extends Cubit<SignUpStates> {
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController secondCameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final _auth = auth.FirebaseAuth.instance;
//   final FirebaseFirestore fireStore = FirebaseFirestore.instance;
//   bool isPasswordVisible = false;
//   bool isConfirmPasswordVisible = false;
//
//   static SignUpCubit get(BuildContext context) => BlocProvider.of(context);
//
//   SignUpCubit() : super(SignUpInitial());
//
//   static Future<void> addUserToFireStore(User user) {
//     final collection = BaseCubit.getUsersCollection();
//     final docRef = collection.doc(user.id);
//     return docRef.set(user);
//   }
//
//   Future<void> signUp({
//     required String email,
//     required String password,
//     required String firstName,
//     required String lastName,
//     required BuildContext context,
//   }) async {
//     try {
//       emit(SignUpLoading());
//       if (passwordController.text != confirmPasswordController.text) {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Passwords do not match."),
//             ),
//           );
//         }
//         emit(SignUpFailure("Passwords do not match."));
//         return;
//       }
//       final auth.UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       final User userModel = User(
//         id: userCredential.user!.uid,
//         firstName: firstName,
//         lastName: lastName,
//         email: email,
//       );
//       addUserToFireStore(userModel).then((value) {
//         Navigator.pushReplacementNamed(context, Routes.pageIndicator);
//       });
//       emit(SignUpSuccess(userCredential.user!.uid));
//     } on auth.FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("The password provided is too weak."),
//             ),
//           );
//         }
//         emit(SignUpFailure(e.toString()));
//       } else if (e.code == 'email-already-in-use') {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Email already in use")),
//           );
//         }
//         emit(SignUpFailure(e.toString()));
//       }
//     } catch (e) {
//       emit(SignUpFailure(e.toString()));
//     }
//   }
//
//   void emitPasswordVisibility(bool value) {
//     isPasswordVisible = value;
//     emit(SignUpPasswordVisibilityChanged(isPasswordVisible));
//   }
//
//   void emitPasswordConfirmVisibility(bool value) {
//     isConfirmPasswordVisible = value;
//     emit(SignUpPasswordVisibilityChanged(isConfirmPasswordVisible));
//   }
// }
