import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/profile_entities.dart';
import '../repositories/profile _repository.dart';

class ProfileUseCase {
  ProfileUseCase(this.repository);

  final ProfileRepository repository;

  Future<Either<Failure, ProfileEntity>> call() async {
    return await repository.getProfile();
  }
}