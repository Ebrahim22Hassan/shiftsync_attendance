import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/login_screen.dart';
import 'core/services/di.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/attendance/presentation/pages/home_page.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'features/profile/presentation/pages/profile_screen.dart';
import 'features/auth/presentation/pages/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'features/attendance/presentation/widgets/map_sample.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => di<AuthCubit>(),
        ),
      ],
      child: SafeArea(
        top: false,
        bottom: false,
        minimum: Platform.isAndroid
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: 10),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
              ),
          home: const LoginScreen(),
        ),
      ),
    );
  }
}
