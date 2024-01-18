import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class SetNewPasswordUseCase {
  final AuthRepository repository;

  SetNewPasswordUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String oldPassword, String newPassword) async {
    return await repository.setNewPassword(oldPassword, newPassword);
  }
}