import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/cart/pages/cart.dart';
import 'package:medlife_v2/features/favorite/pages/favorite.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_states.dart';
import '../../../config/services/metwork.dart';
import '../../../cubit/base_cubit.dart';
import '../../../models/user_model/user_model.dart';
import '../../home/pages/home.dart';
import '../../profile/pages/profile.dart';

class PageIndicatorCubit extends Cubit<PageIndicatorState> {
  PageIndicatorCubit({required this.networkInfo})
      : super(PageIndicatorStateHome());

  static PageIndicatorCubit get(context) => BlocProvider.of(context);
  final NetworkInfo networkInfo;
  int currentIndex = 0;
  TextEditingController idController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController companyInsuranceNameController =
      TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  User? firebaseUser;
  UserModel? myUser;

  final List<Widget> pages = [
    const HomeScreen(),
    const Favorite(),
    const Cart(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(index == 0
        ? PageIndicatorStateHome()
        : index == 1
            ? PageIndicatorStateFavorite()
            : index == 2
                ? PageIndicatorStateCart()
                : PageIndicatorStateProfile());
  }

  void listenToNetworkConnection() {
    networkInfo.isConnected.listen((isConnected) {
      emit(isConnected
          ? PageIndicatorConnectedState()
          : PageIndicatorNotConnectedState());
    });
  }

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
      emailController.text = myUser!.email!;
      idNumberController.text = myUser!.idNumber!;
      emit(PageIndicatorUserLoadedState(myUser!));
    } catch (e) {
      emit(PageIndicatorErrorState(e.toString()));
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
  }
}
