import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/login_screen.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/register_screen.dart';
import '../../../../assets.dart';
import 'core/services/applocal.dart';
import 'core/styles/app_layout.dart';
import 'core/widgets/my_button.dart';
import 'features/profile/presentation/widgets/change_lang_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

int activateIndex = 0;
final controller = CarouselController();

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Align(
                  alignment: Alignment.centerRight, child: ChangeLangWidget()),
              const Spacer(flex: 1),
              Expanded(
                flex: 2,
                child: CarouselSlider.builder(
                    carouselController: controller,
                    itemCount: ImagePaths().carouselImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final carouselImage = ImagePaths().carouselImages[index];
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.h),
                            image: DecorationImage(
                              //fit: BoxFit.cover,
                              image: AssetImage(carouselImage),
                            )),
                      );
                    },
                    options: CarouselOptions(
                      // height: 600,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          activateIndex = index;
                        });
                      },
                    )),
              ),
              const Spacer(),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    MyButton(
                      text: getLang(context, "login"),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen();
                          },
                        ));
                      },
                    ),
                    Gap(15.h),
                    MyButton(
                      outline: true,
                      text: getLang(context, "register"),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen();
                          },
                        ));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
