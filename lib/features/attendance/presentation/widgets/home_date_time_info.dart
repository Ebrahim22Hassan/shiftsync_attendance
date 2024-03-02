import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DateTimeInfo extends StatelessWidget {
  const DateTimeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);
    String formattedDay = DateFormat('EEEE').format(now);
    String formattedTime = DateFormat('hh:mm a').format(now);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              formattedTime,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        const Gap(5),
        SizedBox(
          width: double.infinity,
          child: Center(
            child: Text(
              '$formattedDate, $formattedDay',
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}