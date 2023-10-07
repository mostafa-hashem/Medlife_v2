
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/splash_screen/cubit/splash_screen_states.dart';


class SplashScreenCubit extends Cubit<SplashScreenState>{
  SplashScreenCubit() : super(SplashScreenInitState());
  TextEditingController idController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();

  static SplashScreenCubit get(context) => BlocProvider.of(context);

}