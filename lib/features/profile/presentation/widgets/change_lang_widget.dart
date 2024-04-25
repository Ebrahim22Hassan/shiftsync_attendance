import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_cubit.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_state.dart';

class ChangeLangWidget extends StatelessWidget {
  const ChangeLangWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,state){
        return DropdownButton(
            borderRadius: BorderRadius.circular(8),
            value:cubit.selectedLanguage,
            icon: const Icon(Icons.language),
            onChanged: (String? newValue) {
              cubit.changeLanguage(newValue);
            },
            items: const [
              DropdownMenuItem(value: "ar", child: Text("العربية")),
              DropdownMenuItem(value: "en", child: Text("English")),
            ]);
      },

    );
  }
}
