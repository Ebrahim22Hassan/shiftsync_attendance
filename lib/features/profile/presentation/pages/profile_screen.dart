import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shiftsync_attendance/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:shiftsync_attendance/features/profile/presentation/cubit/profile_cubit.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../auth/presentation/cubit/auth_cubit.dart';
import '../../../auth/presentation/pages/login_screen.dart';
import '../widgets/info_details_widget.dart';
import '../widgets/main_info_widget.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_loading_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthC = MediaQuery.of(context).size.width * 100;
    final authCubit = AuthCubit.get(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoaded) {
                final profile = state.profile;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileHeaderWidget(
                        profileEntity: profile,
                      ),
                      MainInfoWidget(
                        context: context,
                        width: widthC,
                        fullName: profile.fullName ?? '',
                        position: profile.position ?? '',
                      ),
                      InfoDetailsWidget(
                        context: context,
                        width: widthC,
                        email: profile.email ?? '',
                        phoneNumber: profile.phoneNum ?? '',
                      ),
                    ],
                  ),
                );
              } else if (state is ProfileError) {
                return CustomErrorWidget(
                  errorMessage: state.message,
                );
              } else {
                //return const ProfileLoadingWidget();
                return const ProfileLoadingWidget();
              }
            },
          ),
        ),
        const Gap(20),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccessState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            } else if (state is LogoutFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logout failed: ${state.errorMessage}'),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is LogoutLoadingState) {
              return const CircularProgressIndicator();
            } else {
              return AppCustomButton(
                authCubit: authCubit,
                text: "Logout",
                onTap: () {
                  BlocProvider.of<AuthCubit>(context).logout();
                },
              );
            }
          },
        )
      ],
    );
  }
}
