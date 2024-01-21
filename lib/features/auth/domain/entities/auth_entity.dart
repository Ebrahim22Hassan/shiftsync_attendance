import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable  {
  final String? id;
  final String? fullName;
  final String? phoneNum;
  final String? email;
  final String? gender;
  final String? image;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? position;

  const AuthEntity({
    required this.id,
    required this.fullName,
    required this.phoneNum,
    required this.email,
    required this.gender,
    this.image,
    this.createdAt,
    this.updatedAt,
    required this.position,
  });

  @override
  List<Object?> get props => [
    id,
    fullName,
    phoneNum,
    email,
    gender,
    gender,
    image,
    image,
    createdAt,
    updatedAt,
    position,
  ];
}