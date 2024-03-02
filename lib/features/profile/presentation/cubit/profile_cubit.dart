import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/profile_entities.dart';
import '../../domain/usecases/profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileCubit(
      {required this.profileUseCase, required this.updateProfileUseCase})
      : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final result = await profileUseCase.call();
    result.fold(
      (failure) => emit(const ProfileError('Failed to fetch profile data.')),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }

  Future<void> updateProfile({
    required String fullName,
    required String position,
    required String phoneNum,
    required String email,
  }) async {
    emit(ProfileUpdateLoading());
    final result = await updateProfileUseCase(
        fullName: fullName,
        position: position,
        phoneNum: phoneNum,
        email: email);
    result.fold(
      (failure) =>
          emit(const ProfileUpdateFailure('Failed to fetch profile data.')),
      (profile) => emit(ProfileUpdateSuccess()),
    );
  }
}
