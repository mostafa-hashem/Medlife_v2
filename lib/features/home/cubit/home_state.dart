part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeConnectedState extends HomeState {}

class HomeNotConnectedState extends HomeState {}

class HomeUserLoadedState extends HomeState {

  final UserModel user;
  HomeUserLoadedState(this.user);
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}
