import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../features/auth/data/data_sources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_implementation.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/delet_account_usecase.dart';
import '../../features/auth/domain/usecases/forget_password_usecase.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/resend_otp_usecase.dart';
import '../../features/auth/domain/usecases/set_new_password_usecase.dart';
import '../../features/auth/domain/usecases/verify_otp_usecase.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';

final di = GetIt.instance;

Future<void> init() async {
  // Register your use cases here
  di.registerLazySingleton(() => LoginUseCase(di()));
  di.registerLazySingleton(() => RegisterUseCase(di()));
  di.registerLazySingleton(() => ForgetPasswordUseCase(di()));
  di.registerLazySingleton(() => LogoutUseCase(di()));
  di.registerLazySingleton(() => ResendOtpUseCase(di()));
  di.registerLazySingleton(() => VerifyOtpUseCase(di()));
  di.registerLazySingleton(() => SetNewPasswordUseCase(di()));
  di.registerLazySingleton(() => DeleteAccountUseCase(di()));

  // Repository
  di.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      firebaseAuthRemoteDataSource: di(),
    ),
  );

  // Data Source
  di.registerLazySingleton<FirebaseAuthRemoteDataSource>(
    () => FirebaseAuthRemoteDataSourceImpl(firebaseAuth: di<FirebaseAuth>()),
  );

  // Register FirebaseAuth
  di.registerLazySingleton(() => FirebaseAuth.instance);

  // Register your Cubit
  di.registerFactory<AuthCubit>(() => AuthCubit(
        loginUseCase: di<LoginUseCase>(),
        registerUseCase: di<RegisterUseCase>(),
        forgetPasswordUseCase: di<ForgetPasswordUseCase>(),
        logoutUseCase: di<LogoutUseCase>(),
        resendOtpUseCase: di<ResendOtpUseCase>(),
        verifyOtpUseCase: di<VerifyOtpUseCase>(),
        setNewPasswordUseCase: di<SetNewPasswordUseCase>(),
        deleteAccountUseCase: di<DeleteAccountUseCase>(),
      ));
}
