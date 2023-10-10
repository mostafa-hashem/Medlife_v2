import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/payment_method/cubit/payment_method_states.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodStates> {
  PaymentMethodCubit() : super(PaymentMethodInit());

  static PaymentMethodCubit get(BuildContext context) =>
      BlocProvider.of(context);

  List<String> paymentImages = [
    "assets/images/Cash payment.png",
    "assets/images/Insurance payment.png",
  ];

  void navigator(int index){
    if(index == 0){

    }
  }
}
