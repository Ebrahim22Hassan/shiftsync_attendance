import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/core/services/applocal.dart';
import 'package:shiftsync_attendance/core/widgets/conditional_builder.dart';
import '../../../../core/styles/colors.dart';
import '../../../attendance/presentation/pages/switch_page.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/account_info.dart';
import '../widgets/my_back_button.dart';
import '../../../../core/widgets/my_button.dart';
import '../widgets/social_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      bottomNavigationBar: AccountInfo(
        text1: "Don’t have an account?",
        text2: "Register Now",
        onTap: () {
          //   return Navigator.of(context).pushNamedAndRemoveUntil(
          //   Register.routeName,
          //   (route) => true,
          // );
        },
      ),
      appBar: AppBar(leading: const MyBackButton()),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SwitchPage(),
              ),
            );
          }
        },
        builder: (context, state) {
          final authCubit = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: OverflowBar(
                    overflowSpacing: 15,
                    children: [
                      Text(
                        getLang(context, "loginWelcomeMessage"),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: authCubit.email,
                        hintText:   getLang(context, "email"),
                      ),
                      CustomTextFormField(
                        controller: authCubit.passwordRegister,
                        hintText:  getLang(context, "password"),
                        obscureText: true,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            // Navigator.of(context).pushNamedAndRemoveUntil(
                            //   ForgotPassword.routeName,
                            //   (route) => true,
                            // );
                          },
                          child: Text(
                            getLang(context, "forgetPassword"),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors().darkGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                          builder: (context) {
                            return Center(
                              child: MyButton(
                                text:   getLang(context, "login"),
                                onPressed: () async {
                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                  //   HomePage.routeName,
                                  //   (route) => false,
                                  // );
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    // Perform login
                                    await authCubit.loginWithEmailAndPassword(
                                      email: authCubit.email.text,
                                      password: authCubit.passwordRegister.text,
                                    );
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => const SwitchPage(),
                                      ),
                                    );
                                  } else {
                                    print("NOT VALID");
                                  }
                                },
                              ),
                            );
                          }),
                      const SizedBox(height: 15),
                       SocialButton(orText:   getLang(context, "loginWith"),),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
