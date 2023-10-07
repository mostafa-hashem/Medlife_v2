import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_state.dart';
import 'package:medlife_v2/routes/routes.dart';

class LoginCubit extends Cubit<LoginStates> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      emit(LoginLoading());
      final credential =  await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, Routes.pageIndicator);
      }
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("User not found.")));
        }
        emit(LoginFailure(e.toString()));
      } else if (e.code == 'wrong-password') {
        print(e.toString());
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Wrong password")));
        }
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
