import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import 'package:shiftsync_attendance/features/profile/presentation/widgets/profile_image_stack.dart';
import '../../../../assets.dart';
import '../pages/update_profile_screen.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key, required this.profileEntity});

  final ProfileEntity profileEntity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Ink(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImagePaths().cover), fit: BoxFit.cover),
          ),
        ),
        Ink(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.black38,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
              top: 20, left: MediaQuery.of(context).size.width - 70),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors().primary.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 140),
          child: Column(
            children: <Widget>[
              Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  color: AppColors().grey,
                  child: ProfileImageStack(
                    image: profileEntity.image!.isEmpty
                        ? AssetImage(ImagePaths().profile)
                        : NetworkImage(profileEntity.image!) as ImageProvider,
                    profileEntity: profileEntity,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateProfileScreen(
                                  profileEntity: profileEntity,
                                )),
                      );
                    },
                    child: SvgPicture.asset("assets/images/editIcon.svg"),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
