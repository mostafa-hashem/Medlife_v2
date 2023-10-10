import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_cubit.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_states.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator();

  @override
  Widget build(BuildContext context) {
    final pageCubit = PageIndicatorCubit.get(context);
    PageIndicatorCubit.get(context).initUser();

    return BlocConsumer<PageIndicatorCubit, PageIndicatorState>(
      listener: (context, state) {
        if (state is PageIndicatorConnectedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Connected")));
        } else if (state is PageIndicatorNotConnectedState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Disconnected')));
        }
      },
      builder: (context, state) => Scaffold(
        extendBody: true,
        body: pageCubit.pages[pageCubit.currentIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF2E3A58),
          onPressed: () {},
          child: Image.asset("assets/images/category_icon.png"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: AppColors.primary,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            currentIndex: PageIndicatorCubit.get(context).currentIndex,
            onTap: (index) {
              PageIndicatorCubit.get(context).changePage(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: pageCubit.currentIndex == 0
                    ? Image.asset("assets/images/selected_home.png")
                    : Image.asset("assets/images/unSelected_home.png"),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: pageCubit.currentIndex == 1
                    ? Image.asset("assets/images/unSelected_favorite.png")
                    : Image.asset(
                        "assets/images/unSelected_favorite.png",
                      ),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: pageCubit.currentIndex == 2
                    ? Image.asset("assets/images/selected_cart.png")
                    : Image.asset("assets/images/unSelected_cart.png"),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: pageCubit.currentIndex == 3
                    ? Image.asset("assets/images/selected_profile.png")
                    : Image.asset("assets/images/unSelectedProfile.png"),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
