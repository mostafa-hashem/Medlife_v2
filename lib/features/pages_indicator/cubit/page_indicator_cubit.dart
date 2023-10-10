import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/cubit/base_cubit.dart';
import 'package:medlife_v2/features/auth/data/models/user.dart';
import 'package:medlife_v2/features/cart/pages/cart.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_states.dart';
import 'package:medlife_v2/features/profile/pages/profile.dart';
import 'package:medlife_v2/ui/screens/favorite.dart';
import 'package:medlife_v2/ui/screens/home.dart';
import 'package:medlife_v2/utils/network_service.dart';

class PageIndicatorCubit extends Cubit<PageIndicatorState> {
  PageIndicatorCubit({required this.networkInfo})
      : super(PageIndicatorStateHome());

  static PageIndicatorCubit get(BuildContext context) =>
      BlocProvider.of(context);
  final NetworkService networkInfo;
  int currentIndex = 0;
  TextEditingController idController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController companyInsuranceNameController =
      TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  auth.User? firebaseUser;
  User? myUser;

  final List<Widget> pages = [
    const HomeScreen(),
    const Favorite(),
    const Cart(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(
      index == 0
          ? PageIndicatorStateHome()
          : index == 1
              ? PageIndicatorStateFavorite()
              : index == 2
                  ? PageIndicatorStateCart()
                  : PageIndicatorStateProfile(),
    );
  }

  void listenToNetworkConnection() {
    networkInfo.isConnected.listen((isConnected) {
      emit(
        isConnected
            ? PageIndicatorConnectedState()
            : PageIndicatorNotConnectedState(),
      );
    });
  }

  static Future<User?> readUser(String id) async {
    final DocumentSnapshot<User> userSnap =
        await BaseCubit.getUsersCollection().doc(id).get();
    return userSnap.data();
  }

  Future<void> initUser() async {
    try {
      firebaseUser = auth.FirebaseAuth.instance.currentUser;
      myUser = await readUser(firebaseUser!.uid);
      firstNameController.text = myUser!.firstName!;
      secondNameController.text = myUser!.lastName!;
      emailController.text = myUser!.email!;
      idNumberController.text = myUser!.idNumber ?? "";
      emit(PageIndicatorUserLoadedState(myUser!));
    } catch (e) {
      emit(PageIndicatorErrorState(e.toString()));
    }
  }

  void logout() {
    auth.FirebaseAuth.instance.signOut();
  }
}
