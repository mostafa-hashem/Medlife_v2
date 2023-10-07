import '../../../models/user_model/user_model.dart';

abstract class PageIndicatorState {}

class PageIndicatorStateHome extends PageIndicatorState {}

class PageIndicatorStateCart extends PageIndicatorState {}

class PageIndicatorStateFavorite extends PageIndicatorState {}

class PageIndicatorStateProfile extends PageIndicatorState {}

class PageIndicatorConnectedState extends PageIndicatorState {}

class PageIndicatorNotConnectedState extends PageIndicatorState {}

class PageIndicatorUserLoadedState extends PageIndicatorState {
  final UserModel user;

  PageIndicatorUserLoadedState(this.user);
}

class PageIndicatorErrorState extends PageIndicatorState {
  final String error;

  PageIndicatorErrorState(this.error);
}
