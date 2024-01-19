part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final User? user;
  final String errorMessage;
  final String otp;

  const AuthState({
    required this.isLoading,
    required this.user,
    required this.errorMessage,
    required this.otp,
  });

  factory AuthState.initial() {
    return const AuthState(
      isLoading: false,
      user: null,
      errorMessage: '',
      otp: '',
    );
  }

  AuthState copyWith({
    bool? isLoading,
    User? user,
    String? errorMessage,
    String? otp,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [isLoading, user, errorMessage, otp];
}