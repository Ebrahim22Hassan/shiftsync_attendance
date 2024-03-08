import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppStyle {
  ThemeData? theme = ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors().darkGrey),
    ),
    scaffoldBackgroundColor: AppColors().white,
    textTheme: GoogleFonts.urbanistTextTheme().apply(
      bodyColor: AppColors().dark,
      displayColor: AppColors().dark,
    ),
  );
}
