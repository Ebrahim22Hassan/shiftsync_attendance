import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.daysNum,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final int daysNum;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
          contentPadding:
               EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          leading:  Icon(
            icon,
            color: iconColor,
            size: 28.h,
          ),
          title: Text(
            title,
            style:  TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            '$daysNum days',
            style:  TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
            ),
          ),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Adjust the value as needed
          )),
    );
  }
}
