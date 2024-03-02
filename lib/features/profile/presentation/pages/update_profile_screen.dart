import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/core/widgets/conditional_builder.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/switch_page.dart';
import 'package:shiftsync_attendance/features/auth/presentation/widgets/custom_auth_button.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import '../../../../core/services/di.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/profile_image_stack.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, required this.profileEntity});

  final ProfileEntity profileEntity;

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String? fullName, position, phoneNum, email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => di<ProfileCubit>(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Material(
            elevation: 5,
            child: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.deepPurpleAccent,
              ),
              centerTitle: true,
              backgroundColor: Colors.deepPurpleAccent,
              //automaticallyImplyLeading: false,
              title: Text(
                "Update Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 23,
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 45, bottom: 30),
                    child: ProfileImageStack(),
                  ),
                  Column(
                    children: [
                      CustomTextFormField(
                        label: "Full Name",
                        keyboardType: TextInputType.text,
                        hint: widget.profileEntity.fullName,
                        onChanged: (value) {
                          setState(() {
                            fullName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        label: "Position",
                        keyboardType: TextInputType.text,
                        hint: widget.profileEntity.position,
                        onChanged: (value) {
                          setState(() {
                            position = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        label: "Phone Number",
                        keyboardType: TextInputType.text,
                        hint: widget.profileEntity.phoneNum,
                        onChanged: (value) {
                          setState(() {
                            phoneNum = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextFormField(
                        label: "Email",
                        keyboardType: TextInputType.emailAddress,
                        hint: widget.profileEntity.email,
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  ConditionalBuilder(
                      condition: state is! ProfileUpdateLoading,
                      fallback: (context) => const CircularProgressIndicator(),
                      builder: (context) {
                        return AppCustomButton(
                            onTap: () {
                              BlocProvider.of<ProfileCubit>(context)
                                  .updateProfile(
                                fullName: fullName ??
                                    widget.profileEntity.fullName.toString(),
                                position: position ??
                                    widget.profileEntity.position.toString(),
                                phoneNum: phoneNum ??
                                    widget.profileEntity.phoneNum.toString(),
                                email: email ??
                                    widget.profileEntity.email.toString(),
                              );
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SwitchPage(),
                              ));
                            },
                            text: 'Done');
                      }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
