import 'package:bloc/bloc.dart';
import 'package:medlife_v2/features/favorite/cubit/favorite_states.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit() : super(FavoriteInitial());
}
