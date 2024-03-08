import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets.dart';
import '../../../../core/styles/colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => Navigator.pop(context),
      padding: EdgeInsets.zero,
      child: Container(
        width: 41,
        height: 41,
        margin: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors().border),
        ),
        child: Center(
          child: SvgPicture.asset(IconsPaths().backArrowIcon),
        ),
      ),
    );
  }
}
