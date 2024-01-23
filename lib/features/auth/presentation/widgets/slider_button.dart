import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:slide_to_act/slide_to_act.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 1)], // Add shadow
        ),
        child: SlideAction(
          borderRadius: 50,
          elevation: 1,
          innerColor: Color(0xffEBD9B4), // Change innerColor to white
          outerColor:Colors.grey.shade200, // Change outerColor to white
          sliderButtonIcon: Icon(Icons.arrow_forward_ios_sharp),
          text: "Slide To Check In",
          textStyle: TextStyle(color: Colors.black, fontSize: 16),
          onSubmit: () {},
        ),
      ),
    );
    //   Container(
    //   // height: 100,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(50.0), // Adjust this value to match SwipeableButtonView's borderRadius
    //     border: Border.all(
    //       color: Colors.grey, // Add your desired outline color here
    //       width: 2.0, // Add your desired outline width here
    //     ),
    //   ),
    //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
    //   child: SwipeableButtonView(
    //     buttonText: "SLIDE TO CHECK IN",
    //     buttontextstyle: TextStyle(color: Colors.black),
    //     buttonWidget: const Icon(
    //       Icons.arrow_forward_ios_rounded,
    //       color: Colors.grey,
    //     ),
    //     activeColor: Colors.blue,
    //     isFinished: isFinished,
    //     onWaitingProcess: () {
    //       Future.delayed(const Duration(seconds: 2), () {
    //         setState(() {
    //           isFinished = true;
    //         });
    //       });
    //     },
    //     onFinish: () async {
    //       await Navigator.push(
    //         context,
    //         PageTransition(
    //           type: PageTransitionType.fade,
    //           child: const HomePage(),
    //         ),
    //       );
    //
    //       setState(() {
    //         isFinished = false;
    //       });
    //     },
    //   ),
    // );
  }
}

