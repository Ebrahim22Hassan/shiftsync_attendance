import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:shiftsync_attendance/welcome.dart';
import 'core/services/applocal.dart';
import 'core/services/cache_helper.dart';
import 'core/styles/app_style.dart';
import 'core/utils/bloc_observer.dart';
import 'core/services/di.dart';
import 'features/attendance/presentation/cubit/home_cubit.dart';
import 'features/attendance/presentation/cubit/home_state.dart';
import 'features/attendance/presentation/pages/switch_page.dart';
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
  await CacheHelper.init();
  String? token = CacheHelper.getData(key: "userId");
  Widget widget;
    if (token == null){
       widget= const WelcomeScreen();
    } else {
      widget= const SwitchPage();
    }




  if (token == null) {
    widget = const WelcomeScreen();
  } else {
    widget = const SwitchPage();
  }

  await init();
  runApp(MyApp(
    startScreen: widget,
  ));



}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({super.key, required this.startScreen});

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
            create: (context) => HomeCubit()..getMyCurrentLocation()..defineNewDayState()),
      ],
      child: SafeArea(
        top: false,
        bottom: false,
        minimum: Platform.isAndroid
            ? EdgeInsets.zero
            : const EdgeInsets.only(bottom: 10),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context,child){
                return  MaterialApp(
                  locale: Locale("${CacheHelper.getData(key: "lang")}"),
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
                  title: 'ShiftSync',
                  theme: AppStyle().theme,
                  home:  startScreen,
                );
              },

            );
          },
        ),
      ),
    );
  }
}
