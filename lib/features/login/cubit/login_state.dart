abstract class LoginStates {}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginSuccess extends LoginStates {}

class LoginFailure extends LoginStates {
  final String error;

  LoginFailure(this.error);
}
class LoginPasswordVisibilityChanged extends LoginStates{
  bool isVisible;
  LoginPasswordVisibilityChanged(this.isVisible);
}