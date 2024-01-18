import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, User?>> call({required String emailOrPhone, required String password}) async {
    return await repository.signInWithEmailAndPassword(emailOrPhone, password);
  }
}