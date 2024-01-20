import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/login-screen.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class MyCustomSliderButton extends StatefulWidget {
  const MyCustomSliderButton({super.key});

  @override
  _MyCustomSliderButtonState createState() => _MyCustomSliderButtonState();
}

class _MyCustomSliderButtonState extends State<MyCustomSliderButton> {

  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        child: SwipeableButtonView(
            buttonText: "SLIDE TO CHECK IN",
            buttonWidget: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
            ),
            activeColor: Color(0xff3398F6),
            isFinished: isFinished,
            onWaitingProcess: () {
              Future.delayed(Duration(seconds: 2), () {
                setState(() {
                  isFinished = true;
                });
              });
            },
            onFinish: () async {
              await Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      child:  LoginScreen()));

              setState(() {
                isFinished = false;
              });
            }));
  }
}

