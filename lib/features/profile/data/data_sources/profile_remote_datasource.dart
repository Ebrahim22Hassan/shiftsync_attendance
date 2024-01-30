import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileEntity> getProfile();

  Future<dynamic> updateProfile({
    required mobile,
    required email,
    required image,
  });

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
  Future<ProfileEntity> getProfile() async{
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return ProfileEntity.fromJson(doc.data()!); // Implement this method in ProfileEntity
    } else {
      throw Exception('User profile not found.');
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

  @override
  Future updateProfile({required mobile, required email, required image}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
