import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class AttendanceButtonUI extends StatelessWidget {
  const AttendanceButtonUI({
    super.key,
    required Animation<double> animation,
    required this.cubit,
    required this.animationController,
  }) : _animation = animation;

  final Animation<double> _animation;
  final HomeCubit cubit;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {

    Color startBackgroundColor = const Color(0xffF9F5F6);
    Color endBackgroundColor = Colors.grey;
    // Color indicatorBackground = const Color(0xFFB8C7CB);
    Color startProgressColor = const Color(0xFFB8C7CB);
    Color endProgressColor = AppColors().primary;

    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          Color currentBackgroundColor = Color.lerp(
            startBackgroundColor,
            endBackgroundColor,
            _animation.value,
          )!;
          // Color currentProgressColor = Color.lerp(
          //   startProgressColor,
          //   endProgressColor,
          //   _animation.value,
          // )!;

          return BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return CircularPercentIndicator(
                radius: 100.w,
                lineWidth: 10.w,
                circularStrokeCap: CircularStrokeCap.round,
                percent: _animation.value,
                center: Container(
                  height: 175.h,
                  width: 175.h,
                  decoration: BoxDecoration(
                    color:currentBackgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    children: [
                       Gap(45.h),
                      SizedBox(
                        height: 60.h,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 1000),
                          child: cubit.timeUp
                              ? Image.asset(
                            "assets/images/checked.png",
                            key: const ValueKey("checked"),
                          )
                              : Image.asset(
                            "assets/images/touch_in.png",
                            key: const ValueKey("touch_in"),
                          ),
                        ),
                      ),
                       Gap(5.h),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: cubit.timeUp
                            ? const Text(
                          "Have a nice day",
                          style: TextStyle(color: Colors.black),
                        )
                            : Text(
                          cubit.isCheckedIn ? "Check Out" : "Check In",
                          style:  TextStyle(fontSize: 18.sp),
                        ),
                      ),
                    ],
                  ),
                ),
                progressColor: AppColors().primary,
              );
            },
          );
        },
      ),
    );
  }
}
