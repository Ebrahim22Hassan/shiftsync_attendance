import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class DateTimeInfo extends StatefulWidget {
  const DateTimeInfo({Key? key}) : super(key: key);

  @override
  _DateTimeInfoState createState() => _DateTimeInfoState();
}

class _DateTimeInfoState extends State<DateTimeInfo> {
  late Stream<DateTime> _dateTimeStream;
  final DateFormat _timeFormat = DateFormat('hh:mm a');
  final DateFormat _dateFormat = DateFormat('dd MMM yyyy');
  final DateFormat _dayFormat = DateFormat('EEEE');

  @override
  void initState() {
    super.initState();
    _dateTimeStream = Stream<DateTime>.periodic(const Duration(seconds: 1), (_) => DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _dateTimeStream,
      builder: (context, snapshot) {

          DateTime currentTime = snapshot.data ?? DateTime.now();
          String formattedTime = _timeFormat.format(currentTime);
          String formattedDate = _dateFormat.format(currentTime);
          String formattedDay = _dayFormat.format(currentTime);

          return Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    formattedTime,
                    style:  TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
               Gap(5.h),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    '$formattedDate, $formattedDay',
                    style:  TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          );

      },
    );
  }
}
