import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/profile_entities.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required super.id,
    required String super.fullName,
    required String super.phoneNum,
    required String super.gender,
    required String super.position,
    required String super.email,
    super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProfileModel.fromFirebaseUser(User user) {

    return ProfileModel(
      id: user.uid,
      fullName: user.displayName ?? '',
      phoneNum: user.phoneNumber ?? '',
      gender: '', // You might extract the gender if available
      position: '', // You might extract the position if available
      email: user.email ?? '',
      image: '', // You might extract the user image URL if available
      createdAt: Timestamp.now(), // You might use user metadata to get the creation time
      updatedAt: Timestamp.now(),
    );
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
//
// import '../../domain/entities/profile_entities.dart';
//
// class ProfileModel extends ProfileEntity {
//    ProfileModel({
//     super.id,
//     super.fullName,
//     super.phoneNum,
//     super.gender,
//     super.position,
//     super.email,
//     super.image,
//     super.createdAt,
//     super.updatedAt,
//   });
//
//   factory ProfileModel.fromFirebaseUser(User user) {
//     // Extract relevant information from the Firebase User object
//     // This method can be customized based on your application's requirements
//     return ProfileModel(
//       id: user.uid,
//       fullName: user.displayName ?? '',
//       phoneNum: user.phoneNumber ?? '',
//       gender: '', // You might extract the gender if available
//       position: '', // You might extract the position if available
//       email: user.email ?? '',
//       image: '', // You might extract the user image URL if available
//       createdAt: DateTime.now(), // You might use user metadata to get the creation time
//       updatedAt: DateTime.now(),
//     );
//   }
// }