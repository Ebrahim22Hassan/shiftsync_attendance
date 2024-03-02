import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../attendance/presentation/widgets/cards_widget.dart';
import '../widgets/progress_widget.dart';

class AttendanceReportPage extends StatelessWidget {
  const AttendanceReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 32, bottom: 24),
                    child: Text(
                      "Attendance Report",
                      style: TextStyle(
                        fontFamily: "NexaBold",
                        fontSize: screenWidth / 18,
                      ),
                    ),
                  ),
                  ProgressIndicatorWidget(
                    profileEntity: state.profile,
                  ),
                  const SizedBox(height: 50),
                  const CardWidget(
                      title: 'Sick Leaves',
                      daysNum: 0,
                      icon: Icons.local_hospital_outlined,
                      iconColor: Colors.red),
                  const CardWidget(
                      title: 'Late',
                      daysNum: 5,
                      icon: Icons.watch_later_outlined,
                      iconColor: Colors.red),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
