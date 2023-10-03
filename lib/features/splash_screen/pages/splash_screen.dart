import 'package:flutter/material.dart';
import 'package:medlife_v2/features/home/cubit/home_cubit.dart';
import 'package:medlife_v2/routes/routes.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    HomeCubit.get(context).initUser();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        HomeCubit.get(context).firebaseUser != null ? Routes.pageIndicator : Routes.login,
      );
    });
    super.initState();
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
