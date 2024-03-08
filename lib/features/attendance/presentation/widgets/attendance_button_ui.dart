import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class AttendanceButtonUI extends StatelessWidget {
  const AttendanceButtonUI({
    super.key,
    required Animation<double> animation,
    required this.cubit,
  }) : _animation = animation;

  final Animation<double> _animation;
  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    Color background = const Color(0xffF9F5F6);
    Color indicatorBackground = const Color(0xFFB8C7CB);
    // Offset offset = const Offset(26, 26);
    // double blurRadius = 30;
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return BlocBuilder<HomeCubit,HomeState>(
            builder: (context,state){
              return  CircularPercentIndicator(
                radius: 110,
                lineWidth: 10,
                circularStrokeCap: CircularStrokeCap.round,
                percent: _animation.value,
                center: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: cubit.timeUp ? Colors.grey : background,
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
                       SizedBox(
                        height: 70,
                        child: Image(
                          image: cubit.timeUp?const AssetImage("assets/images/checked.png"):const AssetImage("assets/images/touch_in.png"),
                        ),
                      ),
                      Gap(5),
                      cubit.timeUp? const Text("Have a nice day",style: TextStyle(color: Colors.white),):Text(
                        cubit.isCheckedIn ? "Check Out" : "Check In",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                progressColor: cubit.timeUp ?   indicatorBackground:Colors.blue

              );

            },

          );
        },
      ),
    );
  }


}
