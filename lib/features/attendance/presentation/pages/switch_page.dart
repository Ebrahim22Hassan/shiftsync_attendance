import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> 6bac55e1f03ff4ac3b11104afbccee27253a0df8
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/home_page.dart';
import 'package:shiftsync_attendance/features/profile/presentation/pages/profile_screen.dart';
import '../../../history/presentation/pages/attendance_report_page.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({Key? key});

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
    return SafeArea(
      child: Scaffold(
        body: activeScreen[screenIndex],
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(20.w), // Responsive margin using .w
          height: 55.h, // Responsive height using .h
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 30.w, // Responsive blur radius using .w
                offset: Offset(0, 10.h), // Responsive offset using .h
              ),
            ],
            borderRadius: BorderRadius.circular(50.w), // Responsive border radius using .w
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w), // Responsive padding using .w
            child: SalomonBottomBar(
              currentIndex: screenIndex,
              onTap: (index) {
                setState(() {
                  screenIndex = index;
                });
              },
              items: [
                SalomonBottomBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                  selectedColor: AppColors().primary,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  selectedColor: Colors.red,
                ),
                SalomonBottomBarItem(
                  icon: Icon(Icons.history),
                  title: Text('History'),
                  selectedColor: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
