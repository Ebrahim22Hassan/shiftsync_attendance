import 'package:flutter/material.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import '../../../../const.dart';
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
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://images.inc.com/uploaded_files/image/1920x1080/getty_518889586_333442.jpg'),
                fit: BoxFit.cover),
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
                color: Colors.deepPurpleAccent.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.deepPurpleAccent,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  UpdateProfileScreen(profileEntity: profileEntity,)),
              );
            },
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
                color: Colors.deepPurple.shade500,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    border: Border.all(
                      color: Colors.deepPurpleAccent,
                      width: 6.0,
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image.network(
                          profileImage,
                          width: 80,
                          height: 80,
                          fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
