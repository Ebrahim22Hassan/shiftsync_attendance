import 'package:equatable/equatable.dart';


class ServerException extends Equatable implements Exception {
  final String? message;
  const ServerException([this.message]);

  @override
  List<Object?> get props => [message];

  @override
  String toString() => message ?? 'ServerException';
}

class FetchDataException extends ServerException {
  const FetchDataException([String? message])
      : super('Error During Fetching Data: $message');
}

class BadRequestException extends ServerException {
  const BadRequestException([String? message]) : super('Bad Request: $message');
}

class ForbiddenException extends ServerException {
  const ForbiddenException([String? message]) : super('Forbidden Request: $message');
}

class ToManyRequestsException extends ServerException {
  const ToManyRequestsException([String? message]) : super('Forbidden Request: $message');
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException([String? message])
      : super('Unauthorized: $message');
}

class NotFoundException extends ServerException {
  const NotFoundException([String? message])
      : super('Request Info Not Found: $message');
}

class ConflictException extends ServerException {
  const ConflictException([String? message])
      : super('Conflict Occurred: $message');
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([String? message])
      : super('Internal Server Error: $message');
}

class NoInternetConnectionException extends ServerException {
  const NoInternetConnectionException([String? message])
      : super('No Internet Connection: $message');
}

class CacheException implements Exception {}