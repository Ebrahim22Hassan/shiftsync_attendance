import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppStyle {
  ThemeData? theme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors().darkGrey),
    ),
    scaffoldBackgroundColor: AppColors().white,
    textTheme: GoogleFonts.alexandriaTextTheme().apply(
      bodyColor: AppColors().dark,
      displayColor: AppColors().dark,
    ),
  );
}
