import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlife_v2/features/auth/cubit/auth_state.dart';
import 'package:medlife_v2/features/auth/data/models/login_data.dart';
import 'package:medlife_v2/features/auth/data/models/register_data.dart';
import 'package:medlife_v2/features/auth/data/services/auth_firebase_service.dart';
import 'package:medlife_v2/utils/failure.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthFirebaseService authFirebaseService = AuthFirebaseService();
  bool isLoggedIn = false;
  bool isVisible = false;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  AuthCubit() : super(AuthInitial());

  Future<void> register(RegisterData registerData) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.register(registerData);
      isLoggedIn = true;
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  Future<void> login(LoginData loginData) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.login(loginData);
      isLoggedIn = true;
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await authFirebaseService.logout();
      isLoggedIn = false;
      emit(LoggedOut());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  Future<void> requestPasswordReset(String emailAddress) async {
    emit(AuthLoading());
    try {
      await authFirebaseService.requestPasswordReset(emailAddress);
      emit(PasswordResetRequestSent());
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  void getAuthStatus() {
    try {
      isLoggedIn = authFirebaseService.getAuthStatus();
    } catch (e) {
      emit(AuthError(Failure.fromException(e).message));
    }
  }

  void emitPasswordVisibilityLogin(bool value) {
    isVisible = value;
    emit(PasswordVisibilityChanged(isVisible));
  }

  void emitPasswordVisibilitySignup(bool value) {
    isPasswordVisible = value;
    emit(PasswordVisibilityChanged(isPasswordVisible));
  }

  void emitPasswordConfirmVisibilitySignup(bool value) {
    isConfirmPasswordVisible = value;
    emit(PasswordVisibilityChanged(isConfirmPasswordVisible));
  }

}
