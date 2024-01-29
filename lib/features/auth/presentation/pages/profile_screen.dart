import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/auth/presentation/widgets/custom_auth_button.dart';

import '../cubit/auth_cubit.dart';
import '../widgets/info_details_widget.dart';
import '../widgets/main_info_widget.dart';
import '../widgets/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    final authCubit = AuthCubit.get(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const ProfileHeaderWidget(),
              MainInfoWidget(
                context: context,
                width: widthC,
              ),
              InfoDetailsWidget(
                context: context,
                width: widthC,
              ),
              const Gap(20),
              CustomAuthButton(
                authCubit: authCubit,
                authText: "Logout",
                onTap: () {},
              )
            ],
          ),
        ));
  }
}
