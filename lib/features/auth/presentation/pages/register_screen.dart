import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/core/extensions/toast_extenstion.dart';
import 'package:shiftsync_attendance/core/widgets/conditional_builder.dart';
import '../../../../core/services/applocal.dart';
import '../../../../core/widgets/alerts.dart';
import '../../../attendance/presentation/pages/switch_page.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/account_info.dart';
import '../widgets/my_back_button.dart';
import '../../../../core/widgets/my_button.dart';
import '../widgets/social_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "/register";

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      bottomNavigationBar: AccountInfo(
        text1: "Already have an account?",
        text2: "Login Now",
        onTap: () {
          //   return Navigator.of(context).pushNamedAndRemoveUntil(
          //   Login.routeName,
          //   (route) => true,
          // );
        },
      ),
      appBar: AppBar(
        leading: const MyBackButton(),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            final cubit = AuthCubit.get(context);
            cubit.value = null;
            cubit.name.clear();
            cubit.phoneRegister.clear();
            cubit.email.clear();
            cubit.passwordRegister.clear();
            cubit.age.clear();

            cubit.saveUserDataToFirestore(state.authEntity);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SwitchPage(),
              ),
            );
          }
        },
        builder: (context, state) {
          final authCubit = AuthCubit.get(context);
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: OverflowBar(
                  overflowSpacing: 15,
                  children: [
                    Text(
                      getLang(context, "registerWelcomeMessage"),
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: authCubit.name,
                      hintText:   getLang(context, "fullName"),
                      keyboardType: TextInputType.text,
                    ),
                    CustomTextFormField(
                      controller: authCubit.phoneRegister,
                      hintText:   getLang(context, "phoneNumber"),
                      keyboardType: TextInputType.phone,
                    ),
                    CustomTextFormField(
                      controller: authCubit.email,
                      hintText:   getLang(context, "email"),
                    ),
                    CustomTextFormField(
                      controller: authCubit.passwordRegister,
                      hintText:   getLang(context, "password"),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                     CustomTextFormField(
                      hintText:   getLang(context, "confirmPassword"),
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 5),
                    ConditionalBuilder(
                        condition: state is RegisterFailureState ||
                            state is! RegisterLoadingState,
                        fallback: (context) => const Center(child: CircularProgressIndicator()),
                      builder: (context) {
                        return Center(
                          child: MyButton(
                            key: formKey,
                            text:  getLang(context, "register"),
                            onPressed: () {
                              Pattern pattern =
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                              RegExp regExp = RegExp(pattern.toString());
                              if (authCubit.name.text.isEmpty) {
                                context.toast(
                                  text: 'pleaseEnterYourName',
                                  state: ToastStates.error,
                                );
                              } else if (authCubit.phoneRegister.text.isEmpty) {
                                context.toast(
                                  text: 'pleaseEnterYourPhoneNumber',
                                  state: ToastStates.error,
                                );
                              } else if (authCubit.phoneRegister.text.length < 9) {
                                context.toast(
                                  text: 'pleaseThePhoneNumberMustBe9Digits',
                                  state: ToastStates.error,
                                );
                              } else if (!authCubit.phoneRegister.text.startsWith('5')) {
                                context.toast(
                                  text: 'pleaseThePhoneNumberMustStartWith5',
                                  state: ToastStates.error,
                                );
                              } else if (authCubit.email.text.isEmpty) {
                                context.toast(
                                  text: 'pleaseEnterYourEmail',
                                  state: ToastStates.error,
                                );
                              } else if (authCubit.email.text.contains(regExp) != true) {
                                context.toast(
                                  text: 'pleaseEnterValidEmail',
                                  state: ToastStates.error,
                                );
                              } else if (authCubit.passwordRegister.text.isEmpty) {
                                context.toast(
                                  text: 'pleaseEnterYourPassword',
                                  state: ToastStates.error,
                                );
                              } else {
                                authCubit.register(
                                  fullName: authCubit.name.text,
                                  phoneNum: authCubit.phoneRegister.text,
                                  gender: 'male',
                                  position: authCubit.position.text,
                                  email: authCubit.email.text,
                                  password: authCubit.passwordRegister.text,
                                );
                              }
                              // Navigator.of(context).pushNamedAndRemoveUntil(
                              //   HomePage.routeName,
                              //   (route) => false,
                              // );
                            },
                          ),
                        );
                      }
                    ),
                    const SizedBox(height: 15),
                     SocialButton(orText:   getLang(context, "loginWith"),),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
