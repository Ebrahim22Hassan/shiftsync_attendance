import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/core/services/applocal.dart';
import 'package:shiftsync_attendance/core/widgets/conditional_builder.dart';
import 'package:shiftsync_attendance/features/auth/presentation/pages/register_screen.dart';
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
      // bottomNavigationBar: AccountInfo(
      //   text1: "Don’t have an account?",
      //   text2: "Register Now",
      //   onTap: () {
      //    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
      //   },
      // ),
      // appBar: AppBar(
      //     // leading: const MyBackButton()
      // ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {}
        },
        builder: (context, state) {
          final authCubit = AuthCubit.get(context);
          return Form(
            key: formKey,
            child: ListView(
              children: [
                Padding(
                  padding:  EdgeInsets.all(20.0.r),
                  child: OverflowBar(
                    overflowSpacing: 15,
                    children: [
                      Gap(20.h),

                      Text(
                        getLang(context, "loginWelcomeMessage"),
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontWeight: FontWeight.bold,),
                      ),
                       Gap(30.h),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: authCubit.email,
                        labelText: getLang(context, "email"),
                      ),
                      CustomTextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This field can\'t be empty';
                          } else {
                            return null;
                          }
                        },
                        controller: authCubit.passwordRegister,
                        labelText: getLang(context, "password"),
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
                       Gap(5.h),
                      ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                          builder: (context) {
                            return Center(
                              child: MyButton(
                                text: getLang(context, "login"),
                                onPressed: () async {
                                  // Navigator.of(context).pushNamedAndRemoveUntil(
                                  //   HomePage.routeName,
                                  //   (route) => false,
                                  // );
                                  FocusScope.of(context).unfocus();
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();

                                    await authCubit.loginWithEmailAndPassword(
                                      email: authCubit.email.text,
                                      password: authCubit.passwordRegister.text,
                                    );
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SwitchPage(),
                                      ),
                                    );
                                  } else {
                                    print("LoginPage: Info isNot correct");
                                  }
                                },
                              ),
                            );
                          }),
                       Gap(15.h),
                      Center(
                        child: AccountInfo(
                          text1: "Don’t have an account?",
                          text2: "Register Now",
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterScreen()));
                          },
                        ),
                      ),
                      // SocialButton(
                      //   orText: getLang(context, "loginWith"),
                      // ),
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
