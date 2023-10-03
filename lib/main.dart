import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medlife_v2/config/utils/observer.dart';
import 'package:medlife_v2/firebase_options.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(const MedLife());
}


