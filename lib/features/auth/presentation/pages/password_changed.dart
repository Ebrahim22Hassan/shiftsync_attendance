import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/styles/colors.dart';
import '../widgets/my_button.dart';

class PasswordChanged extends StatefulWidget {
  static const routeName = "/password-changed";
  const PasswordChanged({super.key});

  @override
  State<PasswordChanged> createState() => _PasswordChangedState();
}

class _PasswordChangedState extends State<PasswordChanged>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Lottie.network(
                'https://assets7.lottiefiles.com/packages/lf20_lb7e63po.json',
                controller: _controller,
                fit: BoxFit.fill,
                onLoaded: (composition) {
                  _controller
                    ..duration = composition.duration
                    ..forward();
                },
              ),
            ),
            Text(
              "Password Changed!",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Your password has been changed\nsuccessfully.",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors().grey),
            ),
            const SizedBox(height: 40.0),
            MyButton(
              text: "Back to Login",
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil(
                //   Login.routeName,
                //   (route) => true,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
