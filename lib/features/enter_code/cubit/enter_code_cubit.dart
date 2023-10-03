import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/enter_code/cubit/enter_code_states.dart';

class EnterCodeCubit extends Cubit<EnterCodeStates> {
  EnterCodeCubit() : super(EnterCodeInitial());

  static EnterCodeCubit get(context) => BlocProvider.of(context);
}
