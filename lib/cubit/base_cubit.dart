import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/cubit/base_states.dart';
import 'package:medlife_v2/features/auth/data/models/user.dart';

class BaseCubit extends Cubit<BaseStates> {
  BaseCubit() : super(BaseInitial());
  static BaseCubit get(BuildContext context) => BlocProvider.of(context);

  static CollectionReference<User> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(User.collectionName)
        .withConverter<User>(
          fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
        );
  }

  static String? validateForEmail(String? value) {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (value == null || value.isEmpty) {
      return "Please Enter Email";
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid Email';
      } else {
        return null;
      }
    }
  }

  static String? validate(String? value, String message) {
    if (value == null || value.isEmpty) {
      return message;
    }
    return null;
  }
}
