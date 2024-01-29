import 'package:flutter/material.dart';

class InfoDetailsWidget extends StatelessWidget {
  const InfoDetailsWidget(
      {super.key, required this.width, required this.context});

  final double width;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(15),
            child: const Column(
              children: [
                Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.teal),
                      title: Text("E-Mail"),
                      subtitle: Text("email@gmailc.com"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.teal),
                      title: Text("Phone Number"),
                      subtitle: Text("11-111111-11"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person, color: Colors.teal),
                      title: Text("About"),
                      subtitle: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                    ),
                    Divider(),
                    ListTile(
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