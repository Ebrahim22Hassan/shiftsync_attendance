import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileEntity {
  final String id;
  String? fullName;
    String? phoneNum;
    String? position;
    String? email;
    String? gender;
    String? image;
  final Timestamp createdAt;
   Timestamp updatedAt;

  ProfileEntity({
    required this.id,
    required this.fullName,
    required this.phoneNum,
    required this.position,
    required this.email,
    required this.gender,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProfileEntity.fromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return ProfileEntity(
      id: snapshot.id,
      fullName: data['fullName'] ?? '', // Handle null or missing values
      phoneNum: data['phoneNum'] ?? '',
      email: data['email'] ?? '',
      gender: data['gender'] ?? '',
      image: data['image'] ?? '',
      position: data['position'] ?? '',
      createdAt: data['createdAt'] ?? Timestamp.now(),
      updatedAt: data['updatedAt'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'phoneNum': phoneNum,
      'email': email,
      'gender': gender,
      'image': image,
      'position': position,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
// import 'package:equatable/equatable.dart';
//
// class ProfileEntity extends Equatable {
//   final String? id;
//    String? fullName;
//    String? phoneNum;
//    String? position;
//    String? email;
//    String? gender;
//    String? image;
//   final DateTime? createdAt;
//    DateTime? updatedAt;
//
//    ProfileEntity({
//     required this.id,
//     required this.fullName,
//     required this.phoneNum,
//     required this.position,
//     required this.email,
//     required this.gender,
//     this.image,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory ProfileEntity.fromJson(Map<String, dynamic> json) {
//     return ProfileEntity(
//       id: json['id'],
//       fullName: json['fullName'],
//       phoneNum: json['phoneNum'],
//       email: json['email'],
//       gender: json['gender'],
//       image: json['image'],
//       position: json['position'],
//     );
//   }
//
//   @override
//   List<Object?> get props => [id, fullName, phoneNum, email, gender, image];
// }
