import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/auth_entity.dart';
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
  final LogoutUseCase logoutUseCase;
  final SetNewPasswordUseCase setNewPasswordUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  final ResendOtpUseCase resendOtpUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  AuthCubit({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.forgetPasswordUseCase,
    required this.logoutUseCase,
    required this.setNewPasswordUseCase,
    required this.deleteAccountUseCase,
    required this.resendOtpUseCase,
    required this.verifyOtpUseCase,
  }) : super(AuthInitial());

  String? registerScreen;

  static AuthCubit get(context) => BlocProvider.of<AuthCubit>(context);

  final name = TextEditingController();
  final email = TextEditingController();
  final passwordRegister = TextEditingController();
  final forgetPassword = TextEditingController();
  final phoneForgetPassword = TextEditingController();
  final position = TextEditingController();
  final phoneRegister = TextEditingController();
  final age = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> verifyKey = GlobalKey<FormState>();
  String? value;
  bool hasError = false;
  String currentText = "";

  Future<void> loginWithEmailAndPassword(
      String emailOrPhone, String password) async {
    try {
      emit(LoginLoadingState());

      final result = await loginUseCase.call(
          emailOrPhone: emailOrPhone, password: password);

      result.fold(
        (failure) {
          emit(const LoginFailureState('Login failed'));
        },
        (authEntity) {
          emit(LoginSuccessState(authEntity as AuthEntity));
        },
      );
    } catch (e) {
      emit(const LoginFailureState('Login failed'));
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
      emit(RegisterLoadingState());

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
          emit(const RegisterFailureState('Registration failed'));
        },
        (user) {
          final authEntity = AuthEntity(
              id: user?.uid ?? '',
              fullName: user?.displayName,
              phoneNum: user?.phoneNumber,
              email: user?.email ?? '',
              gender: gender,
              position: position);
          emit(RegisterSuccessState(authEntity));
        },
      );
    } catch (e) {
      emit(const RegisterFailureState('Registration failed'));
    }
  }
}
