import 'package:flutter/material.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_cubit.dart';

class ChangeLangWidget extends StatelessWidget {
  const ChangeLangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return DropdownButton<String>(
        borderRadius: BorderRadius.circular(8),
        value: cubit.selectedLanguage,
        icon: const Icon(Icons.language),
        onChanged: (String? newValue) {
          cubit.changeLanguage(newValue);
        },
        items: const [
          DropdownMenuItem(value: "ar", child: Text("Arabic")),
          DropdownMenuItem(value: "en", child: Text("English")),
        ]);
  }
}
