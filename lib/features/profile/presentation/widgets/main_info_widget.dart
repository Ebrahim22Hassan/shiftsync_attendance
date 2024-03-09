import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: Column(
        children: <Widget>[
          Text(fullName,
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
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