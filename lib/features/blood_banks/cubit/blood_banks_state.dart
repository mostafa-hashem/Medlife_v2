abstract class BloodBanksState {}

class BloodBanksInitial extends BloodBanksState {}

class GetBloodBanksLoading extends BloodBanksState {}

class GetBloodBanksSuccess extends BloodBanksState {}

class GetBloodBanksError extends BloodBanksState {
  final String message;

  GetBloodBanksError(this.message);
}
