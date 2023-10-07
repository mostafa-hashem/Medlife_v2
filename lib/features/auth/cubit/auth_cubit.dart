import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/auth/data/models/login_data.dart';
import 'package:medlife_v2/features/auth/data/models/register_data.dart';
import 'package:medlife_v2/features/auth/data/services/auth_firebase_service.dart';
import 'package:medlife_v2/utils/failure.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthFirebaseService _authFirebaseService;
  bool isLoggedIn = false;

  AuthCubit(this._authFirebaseService) : super(AuthInitial());

  Future<void> register(RegisterData registerData) async {
    emit(AuthLoading());
    try {
      await _authFirebaseService.register(registerData);
      isLoggedIn = true;
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  Future<void> login(LoginData loginData) async {
    emit(AuthLoading());
    try {
      await _authFirebaseService.login(loginData);
      isLoggedIn = true;
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await _authFirebaseService.logout();
      isLoggedIn = false;
      emit(LoggedOut());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  Future<void> requestPasswordReset(String emailAddress) async {
    emit(AuthLoading());
    try {
      await _authFirebaseService.requestPasswordReset(emailAddress);
      emit(PasswordResetRequestSent());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  void getAuthStatus() {
    try {
      isLoggedIn = _authFirebaseService.getAuthStatus();
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }
}
