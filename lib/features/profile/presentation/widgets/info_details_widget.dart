import 'package:flutter/material.dart';
import 'package:shiftsync_attendance/features/profile/presentation/widgets/profile_list_tile.dart';


class InfoDetailsWidget extends StatelessWidget {
  const InfoDetailsWidget(
      {super.key,
      required this.width,
      required this.context,
      required this.email,
      required this.phoneNumber});

  final double width;
  final BuildContext context;
  final String email;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Column(
                  children: [
                    ProfileListTile(
                      title: "E-Mail",
                      subTitle: email,
                      icon: Icons.email,
                    ),
                    const Divider(),
                    ProfileListTile(
                      title: "Phone Number",
                      subTitle: phoneNumber,
                      icon: Icons.phone,
                    ),
                    const Divider(),
                    const ProfileListTile(
                      title: "Branch Location",
                      subTitle: "Makkah",
                      icon: Icons.my_location,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}