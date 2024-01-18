import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'error_message_model.dart';

abstract class Failure extends Equatable {}

class ServerFailure extends Failure {
  final String? error;
  final ErrorMessageModel? errorMessageModel;
  final DioException? dioError;

  ServerFailure([this.error, this.dioError, this.errorMessageModel]);

  @override
  List<Object?> get props => [error];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UnknownFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class InvalidInputFailure extends Failure {
  @override
  List<Object?> get props => [];
}