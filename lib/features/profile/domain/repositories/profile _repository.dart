import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/profile_entities.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getProfile();

  Future<Either<Failure, dynamic>> updateProfile({
    required mobile,
    required email,
    required image,
  });

  Future<Either<Failure, dynamic>> changePassword({
    required oldPassword,
    required newPassword,
  });

  Future<Either<Failure, dynamic>> changeProfileInfo({
    required int mobile,
    required String email,
  });

  Future<Either<Failure, dynamic>> changeProfilePicture(
      {required String image});
}
