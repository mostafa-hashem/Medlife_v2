import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/cart/cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
}
