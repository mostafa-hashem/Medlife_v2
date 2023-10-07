import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/auth/ui/screens/login_screen.dart';
import 'package:medlife_v2/features/auth/ui/screens/reset_password_screen.dart';
import 'package:medlife_v2/features/auth/ui/screens/sign_up_screen.dart';
import 'package:medlife_v2/features/home/cubit/home_cubit.dart';
import 'package:medlife_v2/features/home/pages/home.dart';
import 'package:medlife_v2/features/login/cubit/login_cubit.dart';
import 'package:medlife_v2/features/medical_equipment/cubit/medical_equipments_cubit.dart';
import 'package:medlife_v2/features/medical_equipment/pages/medical_equipments.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_cubit.dart';
import 'package:medlife_v2/features/pages_indicator/pages/page_indicator.dart';
import 'package:medlife_v2/features/payment_method/cubit/payment_method_cubit.dart';
import 'package:medlife_v2/features/payment_method/pages/payment_method.dart';
import 'package:medlife_v2/features/product_details/cubit/product_details_cubit.dart';
import 'package:medlife_v2/features/product_details/pages/product_details.dart';
import 'package:medlife_v2/features/profile/cubit/profile_cubit.dart';
import 'package:medlife_v2/features/profile/pages/profile.dart';
import 'package:medlife_v2/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:medlife_v2/features/sign_up/cubit/signip_cubit.dart';
import 'package:medlife_v2/ui/splash_screen.dart';
import 'package:medlife_v2/utils/network_service.dart';

class Routes {
  static const String pageIndicator = "/pageIndicator";
  static const String splash = "/splashScreen";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String signUp = "/signUp";
  static const String home = "/home";
  static const String medicalEquipments = "/medicalEquipments";
  static const String profile = "/profile";
  static const String productDetails = "/productDetails";
  static const String paymentMethod = "/paymentMethod";
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.pageIndicator:
      final networkInfo = NetworkService(Connectivity());
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => PageIndicatorCubit(networkInfo: networkInfo)
            ..listenToNetworkConnection(),
          child: const PageIndicator(),
        ),
      );
    case Routes.splash:
      return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginScreen(),
        ),
      );
    case Routes.resetPassword:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: const ResetPasswordScreen(),
        ),
      );
    case Routes.medicalEquipments:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => MedicalEquipmentsCubit(),
          child: const MedicalEquipments(),
        ),
      );
    case Routes.signUp:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignUpScreen(),
        ),
      );
    case Routes.home:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeScreen(),
        ),
      );
    case Routes.productDetails:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ProductDetailsCubit(),
          child: ProductDetails(),
        ),
      );
    case Routes.profile:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => ProfileCubit(),
          child: const ProfileScreen(),
        ),
      );
    case Routes.paymentMethod:
      return MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => PaymentMethodCubit(),
          child: const PaymentMethod(),
        ),
      );
    default:
      return null;
  }
}
