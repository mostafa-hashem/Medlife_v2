import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/product_details/cubit/product_details_states.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
}
