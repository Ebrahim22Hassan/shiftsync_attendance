import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../widgets/attendence_time_row.dart';
import '../widgets/home_date_time_info.dart';
import '../widgets/my_custom_neumorophic_button.dart';
import '../widgets/unclickable_attendance_button.dart';
import '../widgets/welcome_and_avatar_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(15.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const WelcomeAndAvatarRow(),
               Gap(20.h),
              const DateTimeInfo(),
               Gap(50.h),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoaded) {
                    return MyCustomNeumorphicButton(
                      profileEntity: state.profile,
                    );
                  } else {
                    return const IgnorePointer(
                      ignoring: true,
                      child: UnClickableAttendanceButton(),
                    );
                  }
                },
              ),
               Gap(55.h),
               Padding(
                padding: EdgeInsets.all(8.w),
                child: const AttendanceTimeRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
