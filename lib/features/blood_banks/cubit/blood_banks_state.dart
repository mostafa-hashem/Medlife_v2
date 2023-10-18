abstract class BloodBanksState {}

class BloodBanksInitial extends BloodBanksState {}

class GetAllBloodBanksLoading extends BloodBanksState {}

class GetAllBloodBanksSuccess extends BloodBanksState {}

class GetAllBloodBanksError extends BloodBanksState {
  final String message;

  GetAllBloodBanksError(this.message);
}
