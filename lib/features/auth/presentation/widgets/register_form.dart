import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/core/extensions/toast_extenstion.dart';
import '../../../../core/widgets/alerts.dart';
import '../../../../core/widgets/conditional_builder.dart';
import '../cubit/auth_cubit.dart';
import '../../../attendance/presentation/pages/home_page.dart';
import '../pages/login_screen.dart';
import 'custom_Text_Form_Field.dart';
import 'custom_auth_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    AuthCubit.get(context).registerScreen = 'RegisterScreen';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AuthCubit>();
    return BlocConsumer<AuthCubit, AuthState>(
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
              builder: (context) => const HomePage(),
            ),
          );
        }
      },
      builder: (context, state) {
        final authCubit = AuthCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                  controller: cubit.name,
                  label: "Full Name",
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.text),
              const Gap(20),
              CustomTextFormField(
                  controller: cubit.phoneRegister,
                  label: "Phone Number",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone),
              const Gap(20),
              CustomTextFormField(
                  controller: cubit.position,
                  label: "Position",
                  prefixIcon: Icons.perm_contact_calendar_rounded,
                  keyboardType: TextInputType.text),
              const Gap(20),
              CustomTextFormField(
                  controller: cubit.email,
                  label: "Email",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress),
              const Gap(20),
              CustomTextFormField(
                  controller: cubit.passwordRegister,
                  label: "Password",
                  prefixIcon: Icons.person,
                  keyboardType: TextInputType.text),
              const Gap(40),
              ConditionalBuilder(
                condition: state is RegisterFailureState ||
                    state is! RegisterLoadingState,
                fallback: (context) => const CircularProgressIndicator(),
                builder: (context) => CustomAuthButton(
                  formKey: formKey,
                  authText: "Register",
                  authCubit: authCubit,
                  onTap: () {
                    //close keyboard
                    FocusScope.of(context).unfocus();
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
                  },
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
