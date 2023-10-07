import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/sign_up/cubit/signup_states.dart';
import 'package:medlife_v2/models/user_model/user_model.dart';
import 'package:medlife_v2/routes/routes.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  var firstNameController = TextEditingController();
  var secondCameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  static SignUpCubit get(context) => BlocProvider.of(context);

  SignUpCubit() : super(SignUpInitial());

  static Future<void> addUserToFireStore(UserModel user) {
    var collection = BaseCubit.getUsersCollection();
    var docRef = collection.doc(user.id);
    return docRef.set(user);
  }

  Future<void> signUp(
      {required String email,
      required String password,
      required String firstName,
      required String secondName,
      required BuildContext context}) async {
    try {
      emit(SignUpLoading());
      if (passwordController.text != confirmPasswordController.text) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Passwords do not match."),
          ));
        }
        emit(SignUpFailure("Passwords do not match."));
        return;
      }
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName,
          secondName: secondName,
          email: email, idNumber: '');
      addUserToFireStore(userModel).then((value) {
        Navigator.pushReplacementNamed(context, Routes.pageIndicator);
      });
      emit(SignUpSuccess(userCredential.user!.uid));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("The password provided is too weak.")));
        }
        emit(SignUpFailure(e.toString()));
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Email already in use")));
        }
        emit(SignUpFailure(e.toString()));
      }
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
  void emitPasswordVisibility(bool value) {
    isPasswordVisible = value;
    emit(SignUpPasswordVisibilityChanged(isPasswordVisible));
  }
  void emitPasswordConfirmVisibility(bool value) {
    isConfirmPasswordVisible = value;
    emit(SignUpPasswordVisibilityChanged(isConfirmPasswordVisible));
  }
}
