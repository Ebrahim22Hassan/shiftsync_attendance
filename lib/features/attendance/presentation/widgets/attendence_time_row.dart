import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_cubit.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_state.dart';

import '../../../../core/services/applocal.dart';

class AttendanceTimeRow extends StatelessWidget {
  const AttendanceTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    double containerHeight = 40.h;
    double containerWidth = 40.w;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/clock_in.png"),
                    ),
                  ),
                ),
                Text("\"${cubit.checkInTime ?? "--:--"}\""),
                Text(getLang(context, "checkInTime")),
              ],
            ),
            Column(
              children: [
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/clock_out.png"),
                    ),
                  ),
                ),
                Text("\"${cubit.checkOutTime ?? "--:--"}\""),
                Text(getLang(context, "checkOutTime")),
              ],
            ),
            Column(
              children: [
                Container(
                  height: containerHeight,
                  width: containerWidth,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/total_hrs.png"),
                    ),
                  ),
                ),
                Text(
                    "\"${cubit.totalHrs == null || cubit.newDay == true ? "--:--" : cubit.totalHrs}\""),
                Text(getLang(context, "totalHrs")),
              ],
            ),
          ],
        );
      },
    );
  }
}
