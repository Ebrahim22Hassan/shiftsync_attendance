import 'package:flutter/material.dart';
import '../cubit/auth_cubit.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key,
     this.formKey,
    required this.authCubit,
    this.onTap, required this.authText,
  });

  final GlobalKey<FormState>? formKey;
  final AuthCubit authCubit;
  final void Function()? onTap;
  final String authText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width/1.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(colors: [
            Color.fromRGBO(143, 148, 251, 1),
            Color.fromRGBO(143, 148, 251, .6),
          ]),
        ),
        child:  Center(
          child: Text(
            authText,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}