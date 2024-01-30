import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/profile_entities.dart';
import '../../domain/usecases/profile_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileCubit({required this.profileUseCase}) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    final result = await profileUseCase.call();
    result.fold(
      (failure) => emit(const ProfileError('Failed to fetch profile data.')),
      (profile) => emit(ProfileLoaded(profile)),
    );
  }
}
