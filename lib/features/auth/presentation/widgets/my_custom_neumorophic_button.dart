import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MyCustomNeumorphicButton extends StatefulWidget {
  MyCustomNeumorphicButton({Key? key}) : super(key: key);

  @override
  State<MyCustomNeumorphicButton> createState() =>
      _MyCustomNeumorphicButtonState();
}

class _MyCustomNeumorphicButtonState extends State<MyCustomNeumorphicButton> {
  @override
  bool isClicked = false;


  Widget build(BuildContext context) {
    Color background = const Color(0xffF9F5F6);
    Offset offset =isClicked? const Offset(10, 10):const Offset(26, 26);
    double blurRadius = isClicked? 5.0:30;
    return Center(
        child: GestureDetector(
           onTap: () {
           setState(() {
              isClicked = !isClicked;
              });
            },
             child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 130,
        width: 130,
        decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.white,
                  offset: -offset,
                  blurRadius: blurRadius,
                  inset: isClicked),
              BoxShadow(
                  color: const Color(0xffa7a9af),
                  offset: offset,
                  blurRadius: blurRadius,
                  inset: isClicked),
            ]),
               child: Center(
                 child: Image(
                     image: AssetImage("assets/images/touch_in.png",),s),
               ),
      ),
    ));
  }
}
