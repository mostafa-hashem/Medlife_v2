import 'package:medlife_v2/features/auth/data/models/user.dart';

abstract class PageIndicatorState {}

class PageIndicatorStateHome extends PageIndicatorState {}

class PageIndicatorStateCart extends PageIndicatorState {}

class PageIndicatorStateFavorite extends PageIndicatorState {}

class PageIndicatorStateProfile extends PageIndicatorState {}

class PageIndicatorConnectedState extends PageIndicatorState {}

class PageIndicatorNotConnectedState extends PageIndicatorState {}

class PageIndicatorUserLoadedState extends PageIndicatorState {
  final User user;

  PageIndicatorUserLoadedState(this.user);
}

class PageIndicatorErrorState extends PageIndicatorState {
  final String error;

  PageIndicatorErrorState(this.error);
}
