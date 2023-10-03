import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/profile/cubit/profile_states.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
}
