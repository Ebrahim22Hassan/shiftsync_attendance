import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../repositories/profile _repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, dynamic>> call({
    fullName,
    position,
    phoneNum,
    email,
    image,
  }) async {
    return await repository.updateProfile(
      fullName: fullName,
      position:position,
      phoneNum: phoneNum,
      email: email,
      image: image,
    );
  }
}