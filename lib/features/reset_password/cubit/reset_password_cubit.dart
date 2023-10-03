import 'package:bloc/bloc.dart';
import 'package:medlife_v2/features/reset_password/cubit/reset_password_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
}
