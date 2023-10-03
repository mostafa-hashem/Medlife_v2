import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medlife_v2/routes/app_route.dart';
import 'package:medlife_v2/routes/routes.dart';

import 'features/home/cubit/home_cubit.dart';
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
          create: (context) => HomeCubit(),
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