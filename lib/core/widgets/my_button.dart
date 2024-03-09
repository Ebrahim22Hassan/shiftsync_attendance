import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final bool outline;
  final void Function()? onPressed;
  const MyButton({
    super.key,
    required this.text,
    this.outline = false,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    AppColors colors = AppColors();
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width/1.5,
        decoration: BoxDecoration(
          color: outline ? Colors.transparent : colors.dark,
          border: Border.all(color: colors.dark),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: outline ? colors.dark : colors.white,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
