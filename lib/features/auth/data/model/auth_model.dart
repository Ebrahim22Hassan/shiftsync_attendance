import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
     super.id,
     super.fullName,
     super.phoneNum,
     super.gender,
     super.position,
     super.email,
     super.image,
     super.createdAt,
     super.updatedAt,
  });

  factory AuthModel.fromFirebaseUser(User user) {
    // Extract relevant information from the Firebase User object
    // This method can be customized based on your application's requirements
    return AuthModel(
      id: user.uid,
      fullName: user.displayName ?? '',
      phoneNum: user.phoneNumber ?? '',
      gender: '', // You might extract the gender if available
      position: '', // You might extract the position if available
      email: user.email ?? '',
      image: '', // You might extract the user image URL if available
      createdAt: DateTime.now(), // You might use user metadata to get the creation time
      updatedAt: DateTime.now(),
    );
  }
}