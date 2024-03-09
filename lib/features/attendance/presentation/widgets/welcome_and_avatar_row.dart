import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/applocal.dart';
import '../../../profile/presentation/cubit/profile_cubit.dart';
import '../../../profile/presentation/widgets/change_lang_widget.dart';

class WelcomeAndAvatarRow extends StatelessWidget {
  const WelcomeAndAvatarRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
              if (state is ProfileLoaded) {
                String userName = state.profile.fullName ?? 'Welcome,';
                return Text(
                  '${getLang(context, "welcomeMessage")}, $userName',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                );
              } else {
                return Text(
                  '${getLang(context, "welcomeMessage")}, Employee',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                );
              }
            }),
            const Text(
              "Good Morning, Mark Your attendance",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const ChangeLangWidget(),
        // Container(
        //   height: 50,
        //   width: 50,
        //   decoration: const BoxDecoration(
        //     shape: BoxShape.circle,
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/1077012.png"),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}