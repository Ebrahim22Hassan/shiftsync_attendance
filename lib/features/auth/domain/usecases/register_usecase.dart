import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, User?>> call({
    required String firstName,
    required String secondName,
    required String phone,
    required String gender,
    required String position,
    required String email,
    required String password,
  }) async {
    return await repository.registerWithEmailAndPassword(
      firstName: firstName,
      secondName: secondName,
      phone: phone,
      gender: gender,
      position: position,
      email: email,
      password: password,
    );
  }
}