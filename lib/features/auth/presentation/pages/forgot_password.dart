import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/styles/colors.dart';
import '../widgets/account_info.dart';
import '../widgets/my_back_button.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

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
                const Gap(22),
                 CustomTextFormField(
                validator:(value) {
                  if (value!.isEmpty) {
                    return 'This field can\'t be empty';
                  } else {
                    return null;
                  }
                },
                    labelText: "Enter your email"),
                const Gap(28),

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
