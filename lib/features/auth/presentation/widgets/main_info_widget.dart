import 'package:flutter/material.dart';

class MainInfoWidget extends StatelessWidget {
  const MainInfoWidget({super.key, required this.width, required this.context});

  final double width;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(10),
      alignment: AlignmentDirectional.center,
      child: const Column(
        children: <Widget>[
          Text('Lorem Ipsum',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Flutter',
              style: TextStyle(
                  color: Colors.blue, fontStyle: FontStyle.italic))
        ],
      ),
    );
  }
}