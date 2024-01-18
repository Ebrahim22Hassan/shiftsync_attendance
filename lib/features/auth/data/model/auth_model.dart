import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
     String? id,
     String? firstName,
     String? lastName,
     String? phoneNum,
     String? gender,
     String? position,
     String? email,
     String? image,
     DateTime? createdAt,
     DateTime? updatedAt,
  }) : super(
    id: id,
    firstName: firstName,
    lastName: lastName,
    phoneNum: phoneNum,
    gender: gender,
    position: position,
    email: email,
    image: image,
    createdAt: createdAt,
    updatedAt: updatedAt,
  );

  factory AuthModel.fromFirebaseUser(User user) {
    // Extract relevant information from the Firebase User object
    // This method can be customized based on your application's requirements
    return AuthModel(
      id: user.uid,
      firstName: user.displayName ?? '',
      lastName: '', // You might extract the second name if available
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