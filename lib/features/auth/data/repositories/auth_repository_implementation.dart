import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthRemoteDataSource firebaseAuthRemoteDataSource;

  AuthRepositoryImpl({required this.firebaseAuthRemoteDataSource});

  @override
  Future<Either<Failure, User?>> registerWithEmailAndPassword({
    required String fullName,
    required String phone,
    required String gender,
    required String position,
    required String email,
    required String password,
  }) async {
    try {
      final User? user = await firebaseAuthRemoteDataSource.registerWithEmailAndPassword(
        fullName: fullName,
        phone: phone,
        gender: gender,
        position: position,
        email: email,
        password: password,
      );
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(message: 'Registration failed'));
    }
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword(String email, String password) async {
    try {
      final User? user = await firebaseAuthRemoteDataSource.signInWithEmailAndPassword(email, password);
      return Right(user);
    } catch (e) {
      return Left(AuthFailure(message: 'Login failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword(String email) async {
    try {
      await firebaseAuthRemoteDataSource.forgetPassword(email);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Forget password failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(String email, String newPassword, String code) async {
    try {
      await firebaseAuthRemoteDataSource.resetPassword(email, newPassword, code);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Password reset failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await firebaseAuthRemoteDataSource.logout();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Logout failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> setNewPassword(String oldPassword, String newPassword) async {
    try {
      await firebaseAuthRemoteDataSource.setNewPassword(oldPassword, newPassword);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Setting new password failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAccount() async {
    try {
      await firebaseAuthRemoteDataSource.deleteAccount();
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Account deletion failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendOtp(String phoneNumber) async {
    try {
      // Implement the logic for sending OTP
      await firebaseAuthRemoteDataSource.sendOtp(phoneNumber);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Sending OTP failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyOtp(String otp) async {
    try {
      await firebaseAuthRemoteDataSource.verifyOtp(otp);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'OTP verification failed'));
    }
  }

  @override
  Future<Either<Failure, Unit>> resendOtp(String phoneNumber) async {
    try {
      // Implement the logic for resending OTP
      await firebaseAuthRemoteDataSource.resendOtp(phoneNumber);
      return const Right(unit);
    } catch (e) {
      return Left(AuthFailure(message: 'Resending OTP failed'));
    }
  }
}