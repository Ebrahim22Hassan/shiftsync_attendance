import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import 'package:shiftsync_attendance/core/widgets/conditional_builder.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/switch_page.dart';
import 'package:shiftsync_attendance/core/widgets/my_button.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import '../../../../core/services/di.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../cubit/profile_cubit.dart';
import '../widgets/change_lang_widget.dart';
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
              centerTitle: true,
              backgroundColor: AppColors().primary,
              //automaticallyImplyLeading: false,
              title: const Text(
                "Update Profile",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Center(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: ChangeLangWidget()),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 45, bottom: 30),
                    child: ProfileImageStack(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: OverflowBar(
                      overflowSpacing: 15,
                      children: [
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field can\'t be empty';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          hintText:
                              widget.profileEntity.fullName ?? 'Full Name',
                          onChanged: (value) {
                            setState(() {
                              fullName = value;
                            });
                          },
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field can\'t be empty';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          hintText: widget.profileEntity.position ?? 'Position',
                          onChanged: (value) {
                            setState(() {
                              position = value;
                            });
                          },
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field can\'t be empty';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.phone,
                          hintText:
                              widget.profileEntity.phoneNum ?? 'Phone Number',
                          onChanged: (value) {
                            setState(() {
                              phoneNum = value;
                            });
                          },
                        ),
                        CustomTextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field can\'t be empty';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          hintText: widget.profileEntity.email ?? 'E-Mail',
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ConditionalBuilder(
                      condition: state is! ProfileUpdateLoading,
                      fallback: (context) => const CircularProgressIndicator(),
                      builder: (context) {
                        return MyButton(
                            onPressed: () {
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
