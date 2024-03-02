import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const WelcomeAndAvatarRow(),
              const Gap(35),
              const DateTimeInfo(),
              const Gap(50),
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
              const Gap(60),
              const Padding(
                padding: EdgeInsets.all(8),
                child: AttendanceTimeRow(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
