import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
            const Stack(
              alignment: AlignmentDirectional.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  radius: 60,
                ),
                CircleAvatar(
                  backgroundColor: Colors.deepPurpleAccent,
                  radius: 55,
                  backgroundImage: NetworkImage(profileImage),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 5,
                end: 5,
              ),
              child: SizedBox(
                height: 25,
                width: 27,
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
