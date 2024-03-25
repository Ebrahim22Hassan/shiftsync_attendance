import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/home_page.dart';
import 'package:shiftsync_attendance/features/profile/presentation/pages/profile_screen.dart';
import '../../../history/presentation/pages/attendance_report_page.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  int screenIndex = 0;
  List<Widget> activeScreen = const [
    HomePage(),
    ProfileScreen(),
    AttendanceReportPage()
  ];

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).fetchProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            body: activeScreen[screenIndex],
            bottomNavigationBar: Container(
                margin: EdgeInsets.all(displayWidth * 0.05),
                height: displayWidth * 0.155,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 30,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: displayWidth * 0.05),
                  child: SalomonBottomBar(
                    currentIndex: screenIndex,
                    onTap: (index) {
                      setState(() {
                        screenIndex = index;
                      });
                    },
                    items: [
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.home),
                        title: const Text('Home'),
                        selectedColor: AppColors().primary,
                      ),
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.person),
                        title: const Text('Profile'),
                        selectedColor: Colors.red,
                      ),
                      SalomonBottomBarItem(
                        icon: const Icon(Icons.history),
                        title: const Text('History'),
                        selectedColor: Colors.green,
                      ),
                    ],
                  ),
                ))));
  }
}
