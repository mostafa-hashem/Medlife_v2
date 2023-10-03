import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/cubit/base_states.dart';
import 'package:medlife_v2/models/user_model/user_model.dart';

class BaseCubit extends Cubit<BaseStates>{
  BaseCubit() :super(BaseInitial());
  static BaseCubit get(context) => BlocProvider.of(context);

  static CollectionReference<UserModel> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.COLLECTIN_NAME)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
      toFirestore: (user, options) => user.toJson(),
    );
  }

}