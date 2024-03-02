import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UnClickableAttendanceButton extends StatelessWidget {
  const UnClickableAttendanceButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: CircularPercentIndicator(
          radius: 110,
          lineWidth: 10,
          circularStrokeCap: CircularStrokeCap.round,
          percent: 1.0,
          center: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Color(0xffF9F5F6),
              shape: BoxShape.circle,
            ),
            child: const Column(
              children: [
                Gap(50),
                SizedBox(
                  height: 70,
                  child: Image(
                    image: AssetImage("assets/images/touch_in.png"),
                  ),
                ),
                Text(
                  "Check In",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          progressColor: Colors.transparent,
        ),
      ),
    );
  }
}