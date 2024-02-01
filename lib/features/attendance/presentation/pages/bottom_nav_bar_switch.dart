import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/home_page.dart';
import 'package:shiftsync_attendance/features/profile/presentation/pages/profile_screen.dart';
import '../../../../core/services/di.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import 'attendance_history_page.dart';

class BottomNavBarSwitch extends StatefulWidget {
  const BottomNavBarSwitch({super.key});

  @override
  State<BottomNavBarSwitch> createState() => _BottomNavBarSwitchState();
}

class _BottomNavBarSwitchState extends State<BottomNavBarSwitch> {
  int screenIndex = 0;
  List<Widget> activeScreen = const [HomePage(), ProfileScreen(), AttendanceHistoryPage()];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery
        .of(context)
        .size
        .width;
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
                        selectedColor: Colors.blue,
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
