import 'package:flutter/material.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_cubit.dart';
import 'package:medlife_v2/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController idController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();

  @override
  void initState() {
    PageIndicatorCubit.get(context).initUser();
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        PageIndicatorCubit.get(context).firebaseUser != null
            ? Routes.pageIndicator
            : Routes.login,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splsh logo.png"),
      ),
    );
  }
}
