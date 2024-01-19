import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/usecases/delet_account_usecase.dart';
import '../../domain/usecases/forget_password_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../../domain/usecases/resend_otp_usecase.dart';
import '../../domain/usecases/set_new_password_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final SetNewPasswordUseCase resetPasswordUseCase;
  final LogoutUseCase logoutUseCase;
  final SetNewPasswordUseCase setNewPasswordUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  final ResendOtpUseCase resendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
    required this.resetPasswordUseCase,
    required this.logoutUseCase,
    required this.setNewPasswordUseCase,
    required this.deleteAccountUseCase,
    required this.resendOtpUseCase,
    required this.verifyOtpUseCase,
  }) : super(AuthState.initial());

  // Example method for login
  Future<void> loginWithEmailAndPassword(
      String emailOrPhone, String password) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await loginUseCase.call(
          emailOrPhone: emailOrPhone, password: password);

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorMessage: 'Login failed'));
        },
        (user) {
          emit(AuthState(
            isLoading: false,
            user: user,
            errorMessage: '',
            otp: state.otp, // Retain the OTP value from the previous state
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Login failed'));
    }
  }

  Future<void> register({
    required String firstName,
    required String secondName,
    required String phone,
    required String gender,
    required String position,
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await registerUseCase.call(
        firstName: firstName,
        secondName: secondName,
        phone: phone,
        gender: gender,
        position: position,
        email: email,
        password: password,
      );

      result.fold(
        (failure) {
          emit(state.copyWith(
              isLoading: false, errorMessage: 'Registration failed'));
        },
        (user) {
          emit(AuthState(
            isLoading: false,
            user: user,
            errorMessage: '',
            otp: state.otp,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Registration failed'));
    }
  }

  Future<void> logout() async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await logoutUseCase.call();

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, errorMessage: 'Logout failed'));
        },
        (_) {
          emit(AuthState.initial());
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Logout failed'));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await deleteAccountUseCase.call();

      result.fold(
        (failure) {
          emit(state.copyWith(
              isLoading: false, errorMessage: 'Delete account failed'));
        },
        (_) {
          emit(AuthState.initial());
        },
      );
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Delete account failed'));
    }
  }

  Future<void> forgetPassword(String email) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await forgetPasswordUseCase.call(email);

      result.fold(
        (failure) {
          emit(state.copyWith(
              isLoading: false, errorMessage: 'Forget password failed'));
        },
        (_) {
          emit(AuthState.initial());
        },
      );
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Forget password failed'));
    }
  }

  Future<void> resendOtp(String phoneNumber) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await resendOtpUseCase.call(phoneNumber);

      result.fold(
        (failure) {
          emit(state.copyWith(
              isLoading: false, errorMessage: 'Resend OTP failed'));
        },
        (_) {
          emit(AuthState(
            isLoading: false,
            user: state.user,
            errorMessage: '',
            otp: state.otp, // Retain the OTP value from the previous state
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Resend OTP failed'));
    }
  }

  Future<void> setNewPassword(String oldPassword, String newPassword) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await setNewPasswordUseCase.call(oldPassword, newPassword);

      result.fold(
        (failure) {
          emit(state.copyWith(
              isLoading: false, errorMessage: 'Set new password failed'));
        },
        (_) {
          emit(AuthState(
            isLoading: false,
            user: state.user,
            errorMessage: '',
            otp: state.otp, // Retain the OTP value from the previous state
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
          isLoading: false, errorMessage: 'Set new password failed'));
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await verifyOtpUseCase.call(otp);

      result.fold(
        (failure) {
          emit(state.copyWith(
              isLoading: false, errorMessage: 'Verify OTP failed'));
        },
        (_) {
          emit(AuthState(
            isLoading: false,
            user: state.user,
            errorMessage: '',
            otp: '', // Clear the OTP after successful verification
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: 'Verify OTP failed'));
    }
  }
}
