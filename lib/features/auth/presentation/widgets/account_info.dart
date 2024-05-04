import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/styles/colors.dart';

class AccountInfo extends StatelessWidget {
  final String text1;
  final String text2;
  final Function()? onTap;
  const AccountInfo(
      {super.key, required this.text1, this.onTap, required this.text2});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text("$text1\t"),
           Gap(5.w),
          GestureDetector(
            onTap: onTap,
            child: Text(text2, style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: AppColors().primary,
                            fontWeight: FontWeight.bold,
                          ),),
          )
        ],
      )

      // RichText(
      //   textAlign: TextAlign.center,
      //   text: TextSpan(
      //     style: Theme.of(context).textTheme.titleMedium,
      //     children: <TextSpan>[
      //       TextSpan(text: "$text1\t"),
      //       TextSpan(
      //         text: text2,
      //         style: Theme.of(context).textTheme.titleMedium!.copyWith(
      //               color: AppColors().primary,
      //               fontWeight: FontWeight.bold,
      //             ),
      //         recognizer: TapGestureRecognizer()..onTap = onTap,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
