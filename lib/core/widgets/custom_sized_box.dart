import 'package:shiftsync_attendance/core/extensions/mediaquery_extension.dart';
import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox(this.isVertical, this.value, {super.key});

  final bool isVertical;
  final double value;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return isVertical == true
        ? SizedBox(
      width: orientation == Orientation.landscape
          ? context.kWidth(width) * 0.015 * value
          : context.kHeight(height) * 0.015 * value,
    )
        : SizedBox(
      height: orientation == Orientation.landscape
          ? height * 0.015 * value
          : width * 0.015 * value,
    );
  }
}

extension CustomSizedBoxExtension on num {
  Widget get height => CustomSizedBox(false, toDouble());
  Widget get width => CustomSizedBox(true, toDouble());
}