abstract class SignUpStates {}

class SignUpInitial extends SignUpStates {}

class SignUpLoading extends SignUpStates {}

class SignUpSuccess extends SignUpStates {
  final String userId;

  SignUpSuccess(this.userId);
}

class SignUpFailure extends SignUpStates {
  final String error;

  SignUpFailure(this.error);
}