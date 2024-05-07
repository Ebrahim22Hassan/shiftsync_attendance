import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MyCustomBottomNavigationBar extends StatefulWidget {
  const MyCustomBottomNavigationBar({super.key});

  @override
  MyCustomBottomNavigationBarState createState() =>
      MyCustomBottomNavigationBarState();
}

class MyCustomBottomNavigationBarState
    extends State<MyCustomBottomNavigationBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.all((displayWidth * 0.05).h),
        height: (displayWidth * 0.155).h,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (displayWidth * 0.05).w),
          child: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text('Home'),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon:const Icon(Icons.person),
                title:const Text('Profile'),
                selectedColor: Colors.red,
              ),
              SalomonBottomBarItem(
                icon:const Icon(Icons.history),
                title:const Text('History'),
                selectedColor: Colors.green,
              ),
            ],
          ),
        ));
  }
}
