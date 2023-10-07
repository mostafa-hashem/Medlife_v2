import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/auth/data/models/user.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  TextEditingController idController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  static Future<User?> readUser(String id) async {
    final DocumentSnapshot<User> userSnap =
        await BaseCubit.getUsersCollection().doc(id).get();
    return userSnap.data();
  }
}
