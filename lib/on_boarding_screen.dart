import 'package:flutter/material.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: OverBoard(
        pages: onBoardingPages,
        buttonColor: Colors.black,
        inactiveBulletColor: Colors.grey,
        activeBulletColor: Colors.black,
        showBullets: true,
        skipCallback: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
        finishCallback: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
        },
      ),
    );
  }

  final onBoardingPages = [
    PageModel.withChild(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/on1.jpg',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 20),
            const Text(
              'Effortless Attendance Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Track employee attendance with ease using our intuitive app. Say goodbye to manual attendance records and embrace a smarter, more efficient solution.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        color: Colors.white,
        doAnimateChild: false),
    PageModel.withChild(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/on2.jpg',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 20),
            const Text(
              'Stay Informed, Anytime, Anywhere',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Track employee attendance with ease using our intuitive app. Say goodbye to manual attendance records and embrace a smarter, more efficient solution.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        color: const Color(0xff00A6D8),
        doAnimateChild: false),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/on3.jpg',
        title: 'Advanced Security, Seamless Integration',
        body:
            'Ensure accurate attendance records with our robust security features. Utilize location tracking, facial recognition, and fingerprint scanning to verify employee attendance securely and conveniently',
        doAnimateImage: true),
  ];
}
