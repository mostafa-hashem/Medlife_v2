abstract class EnterCodeStates {}

class EnterCodeInitial extends EnterCodeStates {}

class EnterCodeLoading extends EnterCodeStates {}

class EnterCodeSuccess extends EnterCodeStates {}

class EnterCodeFailure extends EnterCodeStates {
  final String error;

  EnterCodeFailure(this.error);
}