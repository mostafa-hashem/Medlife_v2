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
      await _auth
          .signInWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then((value) =>
              () => Navigator.pushReplacementNamed(context, Routes.pageIndicator));
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailure(e.toString()));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailure(e.toString()));
      }
    }
  }
}
