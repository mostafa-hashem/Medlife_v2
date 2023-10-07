import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/features/pages_indicator/cubit/page_indicator_cubit.dart';
import 'package:medlife_v2/routes/app_route.dart';
import 'package:medlife_v2/routes/routes.dart';
import 'config/services/metwork.dart';

class MedLife extends StatelessWidget {
  const MedLife({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) =>
              PageIndicatorCubit(networkInfo: NetworkInfoImpl(Connectivity()))
                ..listenToNetworkConnection(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splash,
            onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
          ),
        );
      },
    );
  }
}
