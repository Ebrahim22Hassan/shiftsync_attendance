import 'package:dartz/dartz.dart';

import 'package:shiftsync_attendance/core/errors/failure.dart';
import 'package:shiftsync_attendance/features/profile/data/data_sources/profile_remote_datasource.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import '../../domain/repositories/profile _repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSources;

  ProfileRepositoryImpl({required this.profileRemoteDataSources});

  @override
  Future<Either<Failure, ProfileEntity>> getProfile()async {
    try {
      final profile = await profileRemoteDataSources.getProfile(); // Implement this method in the remote data source
      return Right(profile);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch profile data.'));
    }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword({required oldPassword, required newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> changeProfileInfo({required int mobile, required String email}) {
    // TODO: implement changeProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> changeProfilePicture({required String image}) {
    // TODO: implement changeProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> updateProfile({required mobile, required email, required image}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  }

  @override
  Future<Either<Failure, dynamic>> changePassword(
      {required oldPassword, required newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> changeProfileInfo(
      {required int mobile, required String email}) {
    // TODO: implement changeProfileInfo
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> changeProfilePicture(
      {required String image}) {
    // TODO: implement changeProfilePicture
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> updateProfile(
      {required mobile, required email, required image}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }

