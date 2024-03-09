import 'package:flutter/material.dart';
import '../../../../core/styles/colors.dart';
import '../widgets/my_back_button.dart';
import '../../../../core/widgets/my_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class CreateNewPassword extends StatelessWidget {
  static const routeName = "/create-new-password";
  const CreateNewPassword({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const MyBackButton()),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OverflowBar(
              overflowSpacing: 10,
              children: [
                Text(
                  "Create new password",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your new password must be unique from those previously used.",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors().grey),
                ),
                const SizedBox(height: 22),
                const CustomTextFormField(
                  hintText: "New Password",
                  obscureText: true,
                ),
                const CustomTextFormField(
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                const SizedBox(height: 28),
                MyButton(
                  text: "Reset Password",
                  onPressed: () {
                    // Navigator.of(context).pushNamedAndRemoveUntil(
                    //   PasswordChanged.routeName,
                    //   (route) => false,
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
