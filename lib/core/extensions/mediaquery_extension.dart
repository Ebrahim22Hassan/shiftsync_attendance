import 'package:flutter/material.dart';

extension MediaQueryExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get toPadding => MediaQuery.of(this).viewPadding.top;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;

  double kWidth(double kWidth) => width * kWidth / 196.6;
  double kHeight(double kHeight) => height * kHeight / 430.2;

  double get appBarHeight => AppBar().preferredSize.height;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;
  double get availableHeight => height - appBarHeight - statusBarHeight - bottomPadding;
}