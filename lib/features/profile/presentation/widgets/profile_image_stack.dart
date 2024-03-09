import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import '../../../../const.dart';

class ProfileImageStack extends StatelessWidget {
  const ProfileImageStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
             Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors().primary,
                  radius: 80,
                ),
                CircleAvatar(
                  backgroundColor: AppColors().grey,
                  radius: 74,
                  backgroundImage: const NetworkImage(profileImage),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 7,
                end: 7,
              ),
              child: SizedBox(
                height: 35,
                width: 37,
                child: GestureDetector(
                    onTap: () {
                    },
                    child: SvgPicture.asset("assets/images/editIcon.svg")),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
