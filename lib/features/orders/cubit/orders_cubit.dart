import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/orders/cubit/orders_state.dart';
import 'package:medlife_v2/features/orders/data/models/order.dart';
import 'package:medlife_v2/features/orders/data/services/orders_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  static OrdersCubit get(BuildContext context) =>
      BlocProvider.of<OrdersCubit>(context);

  final ordersFirebaseService = OrdersFirebaseService();

  Future<void> createOrder(Order order) async {
    emit(CreateOrderLoading());
    try {
      await ordersFirebaseService.createOrder(order);
      emit(CreateOrderSuccess());
    } catch (e) {
      emit(CreateOrderError(Failure.fromException(e).message));
    }
  }
}
