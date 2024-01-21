part of 'auth_cubit.dart';


abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccessState extends AuthState {
  final AuthEntity authEntity;

  const LoginSuccessState(this.authEntity);

  @override
  List<Object> get props => [authEntity];
}

class LoginFailureState extends AuthState {
  final String errorMessage;

  const LoginFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class RegisterLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterSuccessState extends AuthState {
  final AuthEntity authEntity;

  const RegisterSuccessState(this.authEntity);

  @override
  List<Object> get props => [authEntity];
}

class RegisterFailureState extends AuthState {
  final String errorMessage;

  const RegisterFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ForgotPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordFailureState extends AuthState {
  final String errorMessage;

  const ForgotPasswordFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class VerifyOtpLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}


class VerifyOtpResendOtpCodeForgetPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LogoutLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class LogoutSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class LogoutFailureState extends AuthState {
  final String errorMessage;

  const LogoutFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


class DeleteAccountLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class DeleteAccountSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class DeleteAccountFailureState extends AuthState {
  final String error;

  const DeleteAccountFailureState(this.error);

  @override
  List<Object> get props => [error];
}

class ResendOtpLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}


class SetNewPasswordLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

class SetNewPasswordSuccessState extends AuthState {

  @override
  List<Object> get props => [];
}

class SetNewPasswordFailureState extends AuthState {
  final String errorMessage;

  const SetNewPasswordFailureState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class ChangePasswordVisibilityState extends AuthState {
  final bool isPasswordVisible;

  const ChangePasswordVisibilityState(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible];
}


class DropdownState extends AuthState {
  @override
  List<Object?> get props => [];
}
