import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/cart/pages/cart.dart';
import 'package:medlife_v2/features/favorite/pages/favorite.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_states.dart';
import '../../home/pages/home.dart';
import '../../profile/pages/profile.dart';

class PageIndicatorCubit extends Cubit<PageIndicatorState> {
  PageIndicatorCubit() : super(PageIndicatorStateHome());

  static PageIndicatorCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const Cart(),
    const Favorite(),
    const ProfileScreen(),
  ];

  void changePage(int index) {
    currentIndex = index;
    emit(index == 0
        ? PageIndicatorStateHome()
        : index == 1
            ? PageIndicatorStateCart()
            : index == 2
                ? PageIndicatorStateFavorite()
                : PageIndicatorStateProfile());
  }

  void logout(){
    FirebaseAuth.instance.signOut();
  }
}
