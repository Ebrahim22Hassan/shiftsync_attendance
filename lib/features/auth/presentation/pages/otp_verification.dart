import 'package:flutter/material.dart';

import '../../../../core/styles/colors.dart';
import '../widgets/account_info.dart';
import '../widgets/my_back_button.dart';
import '../../../../core/widgets/my_button.dart';

class OTPVerification extends StatelessWidget {
  static const routeName = "/otp-verification";
  const OTPVerification({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AccountInfo(
        text1: "Didn’t received code?",
        text2: "Resend",
        onTap: () => debugPrint("Pressed Resend Button"),
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
                  "OTP Verification",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter the verification code we just sent on\nyour email address.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors().grey),
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textFieldOTP(first: true, last: false, context: context),
                    _textFieldOTP(first: false, last: false, context: context),
                    _textFieldOTP(first: false, last: false, context: context),
                    _textFieldOTP(first: false, last: true, context: context),
                  ],
                ),
                const SizedBox(height: 28),
                MyButton(
                  text: "Verify",
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   CreateNewPassword.routeName,
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

  Widget _textFieldOTP({bool? first, last, required BuildContext context}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors().border),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: AppColors().primary),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
