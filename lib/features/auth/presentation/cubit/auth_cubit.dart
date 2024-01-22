import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> register({
    required String fullName,
    required String phoneNum,
    required String gender,
    required String position,
    required String email,
    required String password,
  }) async {
    try {
      emit(RegisterLoadingState());

      final result = await registerUseCase.call(
        fullName: fullName,
        phone: phoneNum,
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
              fullName: fullName,
              phoneNum: phoneNum,
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

  Future<void> saveUserDataToFirestore(AuthEntity authEntity) async {
    try {
      final userCollection = FirebaseFirestore.instance.collection('users');

      await userCollection.doc(authEntity.id).set({
        'id': authEntity.id,
        'fullName': authEntity.fullName,
        'phoneNum': authEntity.phoneNum,
        'email': authEntity.email,
        'gender': authEntity.gender,
        'position': authEntity.position,
      });
    } catch (e) {
      print('Error saving user data to Firestore: $e');
    }
  }
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      emit(LoginLoadingState());

      final result = await loginUseCase.call(
        email: email,
        password: password,
      );

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
  Future<void> loginWithEmailAndPassword(
      String emailOrPhone, String password) async {
    try {
      emit(LoginLoadingState());

      final result = await loginUseCase.call(
          email: emailOrPhone, password: password);

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
}
