import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_cubit.dart';
import 'package:medlife_v2/firebase_options.dart';
import 'package:medlife_v2/route_manager.dart';
import 'package:medlife_v2/utils/bloc_observer.dart';
import 'package:medlife_v2/utils/network_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  runApp(const MedLife());
}

class MedLife extends StatelessWidget {
  const MedLife();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) =>
              PageIndicatorCubit(networkInfo: NetworkService(Connectivity()))
                ..listenToNetworkConnection(),
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: onGenerateRoute,
          ),
        );
      },
    );
  }
}
