import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String? id;
  final String? fullName;
  final String? phoneNum;
  final String? position;
  final String? email;
  final String? gender;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProfileEntity({
    required this.id,
    required this.fullName,
    required this.phoneNum,
    required this.position,
    required this.email,
    required this.gender,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileEntity.fromJson(Map<String, dynamic> json) {
    return ProfileEntity(
      id: json['id'],
      fullName: json['fullName'],
      phoneNum: json['phoneNum'],
      email: json['email'],
      gender: json['gender'],
      image: json['image'],
      position: json['position'],
    );
  }

  @override
  List<Object?> get props => [id, fullName, phoneNum, email, gender, image];
}
