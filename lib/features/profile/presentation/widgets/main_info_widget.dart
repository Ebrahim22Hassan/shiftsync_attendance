import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/colors.dart';

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget(
      {super.key,
      required this.width,
      required this.context,
      required this.fullName,
      required this.position});

  final double width;
  final BuildContext context;
  final String fullName;
  final String position;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin:  EdgeInsets.all(8.h),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text(fullName,
              style:  TextStyle(
                  fontSize: 16.sp,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),
           Gap(5.h),
          Text(position,
              style:  Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors().darkGrey))
        ],
      ),
    );
  }
}