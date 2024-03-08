import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import '../widgets/account_info.dart';
import '../widgets/my_back_button.dart';
import '../widgets/my_button.dart';
import '../widgets/text_input.dart';

class ForgotPassword extends StatelessWidget {
  static const routeName = "/forgot-password";
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AccountInfo(
        text1: "Remember Password?",
        text2: "Login",
        onTap: () {
        //   return Navigator.of(context).pushNamedAndRemoveUntil(
        //   Login.routeName,
        //   (route) => true,
        // );
        },
      ),
      appBar: AppBar(leading: const MyBackButton()),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OverflowBar(
              overflowSpacing: 10,
              children: [
                Text(
                  "Forgot Password?",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Don't worry! It occurs. Please enter the email address linked with your account.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors().grey),
                ),
                const SizedBox(height: 22),
                const TextInput(hintText: "Enter your email"),
                const SizedBox(height: 28),
                MyButton(
                  text: "Send Code",
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   OTPVerification.routeName,
                    //   (route) => true,
                    // );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
