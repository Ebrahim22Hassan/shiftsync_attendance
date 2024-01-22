import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User?>> registerWithEmailAndPassword({
    required String fullName,
    required String phone,
    required String gender,
    required String position,
    required String email,
    required String password,
  });
  Future<Either<Failure, User?>> signInWithEmailAndPassword(String email, String password);
  Future<Either<Failure, Unit>> forgetPassword(String email);
  Future<Either<Failure, Unit>> resetPassword(String email, String newPassword, String code);
  Future<Either<Failure, Unit>> logout();
  Future<Either<Failure, Unit>> setNewPassword(String oldPassword, String newPassword);
  Future<Either<Failure, Unit>> deleteAccount();

  // Additional methods for OTP functionality
  Future<Either<Failure, Unit>> sendOtp(String phoneNumber);
  Future<Either<Failure, Unit>> verifyOtp(String otp);
  Future<Either<Failure, Unit>> resendOtp(String phoneNumber);
}