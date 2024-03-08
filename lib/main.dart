import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:shiftsync_attendance/welcome.dart';
import 'core/services/applocal.dart';
import 'core/utils/bloc_observer.dart';
import 'core/services/di.dart';

import 'features/attendance/presentation/cubit/home_cubit.dart';
import 'features/attendance/presentation/pages/switch_page.dart';

// import 'features/attendance/presentation/cubit/map_cubit.dart';

import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/profile/presentation/cubit/profile_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// comment

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => di<AuthCubit>(),
        ),
        BlocProvider<ProfileCubit>(
          create: (context) => di<ProfileCubit>()..fetchProfile(),
        ),
        BlocProvider<HomeCubit>(
            create: (context) => HomeCubit()..getMyCurrentLocation()),
      ],
      child: SafeArea(
        top: false,
        bottom: false,
        minimum: Platform.isAndroid
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: 10),
        child: MaterialApp(
          locale: const Locale("en"),
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            MonthYearPickerLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en", ""),
            Locale("ar", ""),
          ],
          localeResolutionCallback: (currentLang, supportLang) {
            if (currentLang != null) {
              for (Locale locale in supportLang) {
                if (locale.languageCode == currentLang.languageCode) {
                  // mySharedPreferences.setString("lang",currentLang.languageCode) ;
                  return currentLang;
                }
              }
            }
            return supportLang.first;
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              // useMaterial3: true,
              ),

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          // useMaterial3: true,
          home: const WelcomeScreen(),
        ),
      ),
    );
  }
}

