import 'package:bloc/bloc.dart';
import 'package:medlife_v2/features/cart/cubit/cart_states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());
}
