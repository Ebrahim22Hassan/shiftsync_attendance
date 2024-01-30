import 'package:flutter/material.dart';
import 'info_details_widget.dart';
import 'main_info_widget.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    return Column(
      children: [
        Stack(
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
                              'https://cdn-icons-png.freepik.com/512/4086/4086679.png',
                              width: 80,
                              height: 80,
                              fit: BoxFit.fill)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        MainInfoWidget(
          context: context,
          width: widthC,
          fullName: 'full name',
          position: 'position',
        ),
        InfoDetailsWidget(
          context: context,
          width: widthC,
          email: 'email',
          phoneNumber: '#########',
        ),
      ],
    );
  }
}
