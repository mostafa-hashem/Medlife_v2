abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class GetUserSuccess extends ProfileState {}

class GetUserError extends ProfileState {
  final String message;

  GetUserError(this.message);
}
