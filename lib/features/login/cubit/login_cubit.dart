// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:medlife_v2/features/login/cubit/login_state.dart';
// import 'package:medlife_v2/route_manager.dart';
//
// class LoginCubit extends Cubit<LoginStates> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//
//   LoginCubit() : super(LoginInitial());
//
//   static LoginCubit get(BuildContext context) => BlocProvider.of(context);
//
//   void emitPasswordVisibility(bool value) {
//     bool isVisible = false;
//     isVisible = value;
//     emit(LoginPasswordVisibilityChanged(isVisible));
//   }
//
//   Future<void> login({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//     try {
//       emit(LoginLoading());
//       await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       if (context.mounted) {
//         Navigator.pushReplacementNamed(context, Routes.pageIndicator);
//       }
//       emit(LoginSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(const SnackBar(content: Text("User not found.")));
//         }
//         emit(LoginFailure(e.toString()));
//       } else if (e.code == 'wrong-password') {
//         if (context.mounted) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(const SnackBar(content: Text("Wrong password")));
//         }
//         emit(LoginFailure(e.toString()));
//       }
//     }
//   }
// }
