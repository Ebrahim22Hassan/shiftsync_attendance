import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  final String title;
  final String subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(icon, color: AppColors().primary),
      ),
      title: Text(title),
      subtitle: Text(
        subTitle,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontSize: 16, color: AppColors().grey),
      ),
    );
  }
}
