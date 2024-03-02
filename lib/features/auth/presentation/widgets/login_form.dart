import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/switch_page.dart';
import '../../../../core/widgets/conditional_builder.dart';
import '../cubit/auth_cubit.dart';
import '../../../attendance/presentation/pages/home_page.dart';
import '../pages/register_screen.dart';
import 'custom_auth_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          print(state);
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
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(30),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(143, 148, 251, .2),
                            blurRadius: 20.0,
                            offset: Offset(0, 10))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                            border:
                            Border(bottom: BorderSide(color: Colors.grey))),
                        child: TextFormField(
                          controller: authCubit.email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Email or Phone number",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: authCubit.passwordRegister,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.grey[400])),
                        ),
                      )
                    ],
                  ),
                ),
                const Gap(30),
                ConditionalBuilder(
                  condition: state is! LoginLoadingState,
                  fallback: (context) => const CircularProgressIndicator(),
                  builder: (context) => AppCustomButton(
                    formKey: formKey,
                    text: "Login",
                    authCubit: authCubit,
                    onTap: () async {
                      // Close the keyboard
                      FocusScope.of(context).unfocus();
                      // Validate the form
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
                ),
                const Gap(30),
                const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                ),
                const Gap(20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      // const Gap(10),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const RegisterScreen()));
                          },
                          child: const Text(
                            "REGISTER NOW",
                            style: TextStyle(
                                color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
