import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../cubit/map_cubit.dart';
import '../cubit/map_state.dart';

class AttendanceButtonUI extends StatelessWidget {
  const AttendanceButtonUI({
    super.key,
    required Animation<double> animation,
    required this.cubit,
  }) : _animation = animation;

  final Animation<double> _animation;
  final MapCubit cubit;

  @override
  Widget build(BuildContext context) {
    Color background = const Color(0xffF9F5F6);
    // Offset offset = const Offset(26, 26);
    // double blurRadius = 30;
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CircularPercentIndicator(
            radius: 110,
            lineWidth: 10,
            circularStrokeCap: CircularStrokeCap.round,
            percent: _animation.value,
            center: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.white,
                //     offset: -offset,
                //     blurRadius: blurRadius,
                //   ),
                //   BoxShadow(
                //     color: const Color(0xffa7a9af),
                //     offset: offset,
                //     blurRadius: blurRadius,
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  const Gap(50),
                  const SizedBox(
                    height: 70,
                    child: Image(
                      image: AssetImage("assets/images/touch_in.png"),
                    ),
                  ),
                  BlocBuilder<MapCubit, MapState>(
                    builder: (context, state) {
                      return Text(
                        cubit.isCheckedIn ? "Check Out" : "Check In",
                        style: const TextStyle(fontSize: 18),
                      );
                    },
                  ),
                ],
              ),
            ),
            progressColor: cubit.locationStatus ? Colors.blue : Colors.red,
          );
        },
      ),
    );
  }
}