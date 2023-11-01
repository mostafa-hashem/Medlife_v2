import 'package:flutter/material.dart';
import 'package:medlife_v2/features/cart/ui/screens/cart_screen.dart';
import 'package:medlife_v2/features/orders/ui/screens/orders_screen.dart';
import 'package:medlife_v2/features/profile/ui/screens/profile_screen.dart';
import 'package:medlife_v2/ui/resources/app_colors.dart';
import 'package:medlife_v2/ui/screens/home_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout();

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[currentIndex],
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
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? Image.asset("assets/images/selected_home.png")
                    : Image.asset("assets/images/unSelected_home.png"),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 1
                    ? const Icon(Icons.history_outlined)
                    : const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                label: 'Orders',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 2
                    ? Image.asset("assets/images/selected_cart.png")
                    : Image.asset("assets/images/unSelected_cart.png"),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: currentIndex == 3
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
