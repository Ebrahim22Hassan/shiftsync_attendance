import 'package:flutter/material.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import '../../domain/entities/profile_entities.dart';

class ProfileImageStack extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final ProfileEntity profileEntity;
  final ImageProvider image;

  const ProfileImageStack({
    super.key,
    this.onTap,
    required this.child,
    required this.profileEntity,
    required this.image,
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
                  radius: 75,
                ),
                CircleAvatar(
                  backgroundColor: AppColors().grey,
                  radius: 70,
                  backgroundImage:image,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 7,
                end: 7,
              ),
              child: SizedBox(
                height: 33,
                width: 33,
                child: GestureDetector(
                  onTap: onTap,
                  child: child,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
