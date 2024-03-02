import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String label;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  final String? hint;

  const CustomTextFormField(
      {super.key,
      this.controller,
      required this.label,
      this.suffixIcon,
      this.prefixIcon,
      required this.keyboardType,
      this.onChanged,
      this.hint});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 8,
      width: width / 1.22,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: width / 30),
      decoration: BoxDecoration(
        // color: const Color(0xff212428),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(label),
          suffixIcon: Icon(suffixIcon),
          prefixIcon: Icon(prefixIcon),
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
      ),
    );
  }
}
