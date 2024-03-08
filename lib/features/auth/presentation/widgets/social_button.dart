import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets.dart';
import '../../../../core/styles/colors.dart';

class SocialButton extends StatelessWidget {
  final String orText;
  const SocialButton({super.key, required this.orText});
  static List<String> socialIcon = [
    IconsPaths().facebookIcon,
    IconsPaths().googleIcon,
    IconsPaths().appgleIcon,
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: AppColors().border)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                orText,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors().darkGrey,
                    ),
              ),
            ),
            Expanded(child: Divider(color: AppColors().border)),
          ],
        ),
        const SizedBox(height: 22),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            socialIcon.length,
            (index) => Expanded(
              child: CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors().border,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: SvgPicture.asset(socialIcon[index]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
