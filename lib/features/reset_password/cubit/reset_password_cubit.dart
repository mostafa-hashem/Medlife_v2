import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/reset_password/cubit/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  var emailController = TextEditingController();

  ResetPasswordCubit() : super(ResetPasswordInitial());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  Future<void> resetPassword(String email, BuildContext context) async {
    try {
      emit(ResetPasswordLoading());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((
          value) =>
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'A password reset code has been sent to your email.'),
            ),
          ));
      emit(ResetPasswordSuccess());
    } catch (e) {
      emit(ResetPasswordFailure(e.toString()));
    }
  }
}
