import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/blood_banks/cubit/blood_banks_state.dart';
import 'package:medlife_v2/features/blood_banks/data/models/blood_bank.dart';
import 'package:medlife_v2/features/blood_banks/data/services/blood_banks_firebase_service.dart';
import 'package:medlife_v2/utils/data/failure/failure.dart';

class BloodBanksCubit extends Cubit<BloodBanksState> {
  BloodBanksCubit() : super(BloodBanksInitial());

  static BloodBanksCubit get(BuildContext context) => BlocProvider.of(context);

  final _bloodBanksFirebaseService = BloodBanksFirebaseService();
  List<BloodBank> bloodBanks = [];

  Future<void> getBloodBanks() async {
    emit(GetBloodBanksLoading());
    try {
      bloodBanks = await _bloodBanksFirebaseService.getBloodBanks();
      emit(GetBloodBanksSuccess());
    } catch (e) {
      emit(GetBloodBanksError(Failure.fromException(e).message));
    }
  }
}
