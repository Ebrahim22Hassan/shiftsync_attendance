import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/map_cubit.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/map_state.dart';

class AttendanceTimeRow extends StatelessWidget {
  const AttendanceTimeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit,MapState>(
      builder: (context,state){
        MapCubit cubit= MapCubit.get(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/clock_in.png"),
                    ),
                  ),
                ),
                 Text("\"${cubit.checkInTime??"--:--"}\""),
                const Text("Check In"),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/clock_out.png"),
                    ),
                  ),
                ),
                 Text("\"${cubit.checkOutTime??"--:--"}\""),
                const Text("Check Out"),
              ],
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("assets/images/total_hrs.png"),
                    ),
                  ),
                ),
                 Text("\"${cubit.totalHrs??"--:--"}\""),
                const Text("Total hrs"),
              ],
            ),
          ],
        );
      },

    );
  }
}
