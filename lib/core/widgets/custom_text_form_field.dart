import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.validator,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: const Color(0xffF7F8F9),
        filled: true,
        labelText: labelText,
        // hintStyle: Theme.of(context)
        //     .textTheme
        //     .titleMedium!
        //     .copyWith(color: AppColors().grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors().border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors().primary),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
