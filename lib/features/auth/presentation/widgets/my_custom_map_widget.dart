import 'package:flutter/material.dart'hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/auth/presentation/widgets/map_sample.dart';

class MyCustomMapWidget extends StatefulWidget {
   MyCustomMapWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomMapWidget> createState() => _MyCustomMapWidgetState();
}

class _MyCustomMapWidgetState extends State<MyCustomMapWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Color background = const Color(0xffF9F5F6);
    Offset offset = const Offset(2, 1);
    double blurRadius = isClicked ? 5.0 : 20;
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: Stack(
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: -offset,
                    blurRadius: 20,
                    inset: isClicked,
                  ),
                  BoxShadow(
                    color: const Color(0xffa7a9af),
                    offset: offset,
                    blurRadius: 20,
                    inset: isClicked,
                  ),

                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: const MapSample(),
            ),
          ],
        ),
      ),
    );
  }
}

