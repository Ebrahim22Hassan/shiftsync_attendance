import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:gap/gap.dart';

class MyCustomNeumorphicButton extends StatefulWidget {
  final String buttonText;

  MyCustomNeumorphicButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  State<MyCustomNeumorphicButton> createState() =>
      _MyCustomNeumorphicButtonState();
}

class _MyCustomNeumorphicButtonState extends State<MyCustomNeumorphicButton> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Color background = const Color(0xffF9F5F6);
    Offset offset = isClicked ? const Offset(10, 10) : const Offset(26, 26);
    double blurRadius = isClicked ? 5.0 : 30;
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClicked = !isClicked;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle, // Uncomment this line for a circular shape
            // borderRadius: BorderRadius.circular(20), // Remove this line
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: -offset,
                blurRadius: blurRadius,
                inset: isClicked,
              ),
              BoxShadow(
                color: const Color(0xffa7a9af),
                offset: offset,
                blurRadius: blurRadius,
                inset: isClicked,
              ),
            ],
          ),
          child: Column(
            children: [
              Gap(12),
              SizedBox(
                height: 50,
                child: Image(
                  image: AssetImage("assets/images/touch_in.png"),
                ),
              ),
              Text(widget.buttonText,style: TextStyle(fontSize: 10),) // Use the buttonText property here
            ],
          ),
        ),
      ),
    );
  }
}
