import 'package:flutter/material.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/login_screen.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/register_screen.dart';
import '../../../../assets.dart';
import 'core/widgets/my_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ImagePaths paths = ImagePaths();
    //AppColors colors = AppColors();
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePaths().image1),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(flex: 10),
                Image.asset(paths.logo, scale: 4),
                const Spacer(),
                MyButton(
                  text: "Login",
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   Login.routeName,
                    //   (route) => true,
                    // );
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ));
                  },
                ),
                const SizedBox(height: 15),
                MyButton(
                  outline: true,
                  text: "Sign up",
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   Register.routeName,
                    //   (route) => true,
                    // );
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const RegisterScreen();
                      },
                    ));
                  },
                ),
                // const Spacer(),
                // CupertinoButton(
                //   onPressed: () {
                //     // Navigator.of(context).pushNamedAndRemoveUntil(
                //     //   HomePage.routeName,
                //     //   (route) => false,
                //     // );
                //   },
                //   padding: EdgeInsets.zero,
                //   child: Text(
                //     "Continue as a guest",
                //     style: Theme.of(context).textTheme.titleSmall!.copyWith(
                //           color: colors.primary,
                //           fontWeight: FontWeight.bold,
                //           decorationColor: colors.primary,
                //           decoration: TextDecoration.underline,
                //         ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
