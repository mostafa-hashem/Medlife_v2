import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/base_cubit.dart';
import '../../../models/user_model/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  // final NetworkInfo networkInfo;
  HomeCubit() : super(HomeInitial());
  User? firebaseUser;
  UserModel? myUser;
  TextEditingController idController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();

  static HomeCubit get(context) => BlocProvider.of(context);

  static Future<UserModel?> readUser(String id) async {
    DocumentSnapshot<UserModel> userSnap =
        await BaseCubit.getUsersCollection().doc(id).get();
    return userSnap.data();
  }

  void initUser() async {
    try {
      firebaseUser = FirebaseAuth.instance.currentUser;
      myUser = await readUser(firebaseUser!.uid);
      firstNameController.text = myUser!.firstName!;
      secondNameController.text = myUser!.secondName!;
      emit(HomeUserLoadedState(myUser!));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

// void listenToNetworkConnection() {
//   networkInfo.isConnected.listen((isConnected) {
//     emit(isConnected ? HomeConnectedState() : HomeNotConnectedState());
//   });
// }
}
