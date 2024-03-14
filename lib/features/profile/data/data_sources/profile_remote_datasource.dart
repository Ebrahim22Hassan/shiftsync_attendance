import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shiftsync_attendance/core/services/cache_helper.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getProfile();

  Future<dynamic> updateProfile(
      {required fullName,
      required position,
      required phoneNum,
      required email,
      image});

  Future<dynamic> changePassword({
    required oldPassword,
    required newPassword,
  });

  Future<dynamic> changeProfileInfo({
    required int mobile,
    required String email,
  });

  Future<dynamic> changeProfilePicture({
    required String image,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore _firestore;

  ProfileRemoteDataSourceImpl({required FirebaseFirestore firestore})
      : _firestore = firestore;

  @override
  Future<ProfileEntity> getProfile() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    CacheHelper.saveData(key: "userId", value: userId);
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return ProfileEntity.fromSnapshot(doc);
    } else {
      throw Exception('User profile not found.');
    }
  }

  @override
  Future updateProfile(
      {required fullName,
      required position,
      required phoneNum,
      required email,
      image}) async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final userRef = _firestore.collection('users').doc(userId);
      final updatedData = {
        'fullName': fullName,
        'position': position,
        'phoneNum': phoneNum,
        'email': email,
      };
      await userRef.update(updatedData);
      if (image != null) {
        await userRef.update({'profileImage': image});
      }
      // Return a success message or updated profile entity if needed
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  @override
  Future changePassword({required oldPassword, required newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future changeProfileInfo({required int mobile, required String email}) {
    // TODO: implement changeProfileInfo
    throw UnimplementedError();
  }

  @override
  Future changeProfilePicture({required String image}) {
    // TODO: implement changeProfilePicture
    throw UnimplementedError();
  }
}
