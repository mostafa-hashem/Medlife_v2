import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/auth/ui/screens/login_screen.dart';
import 'package:medlife_v2/features/auth/ui/screens/register_screen.dart';
import 'package:medlife_v2/features/auth/ui/screens/reset_password_screen.dart';
import 'package:medlife_v2/features/blood_banks/ui/screens/blood_banks_details_screen.dart';
import 'package:medlife_v2/features/blood_banks/ui/screens/blood_banks_screen.dart';
import 'package:medlife_v2/features/medical_equipment/ui/screens/medical_equipment_details_screen.dart';
import 'package:medlife_v2/features/medical_equipment/ui/screens/medical_equipments_screen.dart';
import 'package:medlife_v2/features/medical_services/ui/screens/medical_service_details_screen.dart';
import 'package:medlife_v2/features/medical_services/ui/screens/medical_services_screen.dart';
import 'package:medlife_v2/features/orders/ui/screens/canceled_order_details.dart';
import 'package:medlife_v2/features/orders/ui/screens/current_order_details.dart';
import 'package:medlife_v2/features/orders/ui/screens/delivered_order_details.dart';
import 'package:medlife_v2/features/orders/ui/screens/new_order_details.dart';
import 'package:medlife_v2/features/payment/cubit/payment_cubit.dart';
import 'package:medlife_v2/features/payment/ui/screens/address_screen.dart';
import 'package:medlife_v2/features/payment/ui/screens/checkout_screen.dart';
import 'package:medlife_v2/features/payment/ui/screens/insurance_payment_screen.dart';
import 'package:medlife_v2/features/payment/ui/screens/payment_methods_screen.dart';
import 'package:medlife_v2/features/payment/ui/screens/successful_payment_screen.dart';
import 'package:medlife_v2/features/profile/ui/screens/profile_screen.dart';
import 'package:medlife_v2/ui/screens/home_layout.dart';
import 'package:medlife_v2/ui/screens/home_screen.dart';
import 'package:medlife_v2/ui/screens/splash_screen.dart';

class Routes {
  static const String layout = "/layout";
  static const String splash = "/splashScreen";
  static const String login = "/login";
  static const String resetPassword = "/resetPassword";
  static const String register = "/register";
  static const String home = "/home";
  static const String medicalEquipments = "/medicalEquipments";
  static const String medicalServices = "/medicalServices";
  static const String bloodBanks = "/bloodBanks";
  static const String profile = "/profile";
  static const String medicalEquipmentDetails = "/medicalEquipmentDetails";
  static const String medicalServiceDetails = "/medicalServiceDetails";
  static const String bloodBankDetails = "/bloodBankDetails";
  static const String currentRequestDetails = "/currentRequestDetails";
  static const String newRequestDetails = "/newRequestDetails";
  static const String completedRequestDetails = "/completedRequestDetails";
  static const String canceledRequestDetails = "/canceledRequestDetails";
  static const String paymentMethod = "/paymentMethod";
  static const String insurancePayment = "/insurancePayment";
  static const String checkout = "/checkout";
  static const String address = "/address";
  static const String successfulPayment = "/successfulPayment";
}

Route? onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case Routes.layout:
      return MaterialPageRoute(
        builder: (_) => const HomeLayout(),
      );
    case Routes.splash:
      return MaterialPageRoute(
        builder: (_) => const SplashScreen(),
      );
    case Routes.login:
      return MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      );
    case Routes.resetPassword:
      return MaterialPageRoute(
        builder: (_) => const ResetPasswordScreen(),
      );
    case Routes.medicalEquipments:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MedicalEquipmentsScreen(),
      );
    case Routes.medicalServices:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const MedicalServicesScreen(),
      );
    case Routes.bloodBanks:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const BloodBanksScreen(),
      );
    case Routes.register:
      return MaterialPageRoute(
        builder: (_) => const RegisterScreen(),
      );
    case Routes.home:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      );
    case Routes.medicalEquipmentDetails:
      return MaterialPageRoute(
        builder: (_) => const MedicalEquipmentDetailsScreen(),
        settings: routeSettings,
      );
    case Routes.medicalServiceDetails:
      return MaterialPageRoute(
        builder: (_) => const MedicalServiceDetailsScreen(),
        settings: routeSettings,
      );
    case Routes.bloodBankDetails:
      return MaterialPageRoute(
        builder: (_) => const BloodBankDetailsScreen(),
        settings: routeSettings,
      );
    case Routes.currentRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CurrentOrderDetails(),
      );
    case Routes.newRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const NewOrderDetails(),
      );
    case Routes.completedRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const DeliveredOrderDetails(),
      );
    case Routes.canceledRequestDetails:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const CanceledOrderDetails(),
      );
    case Routes.profile:
      return MaterialPageRoute(
        builder: (_) => const ProfileScreen(),
      );
    case Routes.paymentMethod:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => PaymentCubit(),
          child: const PaymentMethodsScreen(),
        ),
      );
    case Routes.insurancePayment:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => PaymentCubit(),
          child: const InsurancePaymentScreen(),
        ),
      );
    case Routes.checkout:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => PaymentCubit(),
          child: const Checkout(),
        ),
      );
    case Routes.address:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => PaymentCubit(),
          child: const AddressScreen(),
        ),
      );
    case Routes.successfulPayment:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => BlocProvider(
          create: (_) => PaymentCubit(),
          child: const SuccessfulPaymentScreen(),
        ),
      );
    default:
      return null;
  }
}
