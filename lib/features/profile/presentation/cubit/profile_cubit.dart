import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import '../../domain/entities/profile_entities.dart';
import '../../domain/usecases/profile_usecase.dart';
import '../../domain/usecases/update_profile_usecase.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

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

  var picker = ImagePicker();
  File? pickedImg;
  String? storageImg;
  Future pickImg() async {
    emit(PickingImgLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImg = File(pickedFile.path );
      emit(PickingImgSuccessState());
    } else {
      print('No Image Selected');
      emit(PickingImgErrorState());
    }
  }

  void uploadAndDownloadUserImg(){
    emit( UploadingImgLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(pickedImg!.path).pathSegments.last}")
        .putFile(pickedImg!)
        .then((value){
        emit(UploadingImgSuccessState());
        value.ref.getDownloadURL().then((value) {
          storageImg=value;
          emit(DownloadingImgSuccessState());
      }
      )
          .catchError((error){
          emit(DownloadingImgErrorState());
          print(error.toString());
      });
    }

    ).catchError((error){
      emit(UploadingImgErrorState());
    });
  }


}
