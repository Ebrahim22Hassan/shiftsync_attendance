import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../repositories/auth_repository.dart';

class ResendOtpUseCase {
  final AuthRepository repository;

  ResendOtpUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String phoneNumber) async {
    return await repository.resendOtp(phoneNumber);
  }
}