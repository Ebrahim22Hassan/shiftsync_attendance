import 'package:flutter/material.dart';

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
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.teal),
                      title: const Text("E-Mail"),
                      subtitle: Text(email),
                    ),
                    const Divider(),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.teal),
                      title: const Text("Phone Number"),
                      subtitle: Text(phoneNumber),
                    ),
                    const Divider(),
                    const ListTile(
                      leading: Icon(Icons.person, color: Colors.teal),
                      title: Text("About"),
                      subtitle: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                    ),
                    const Divider(),
                    const ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      leading: Icon(Icons.my_location, color: Colors.teal),
                      title: Text("Location"),
                      subtitle: Text("Canada"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}