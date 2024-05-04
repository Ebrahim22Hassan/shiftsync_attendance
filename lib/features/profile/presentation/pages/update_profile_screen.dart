import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shiftsync_attendance/core/styles/colors.dart';
import 'package:shiftsync_attendance/core/widgets/conditional_builder.dart';
import 'package:shiftsync_attendance/features/attendance/presentation/pages/switch_page.dart';
import 'package:shiftsync_attendance/core/widgets/my_button.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import '../../../../assets.dart';
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
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => di<ProfileCubit>(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Material(
            elevation: 5.h,
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
            final profileCubit = BlocProvider.of<ProfileCubit>(context);
            return Center(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                   Padding(
                    padding: EdgeInsets.only(right: 24.0.w, top: 24.0.h),
                    child: const Align(
                        alignment: Alignment.centerRight,
                        child: ChangeLangWidget()),
                  ),
                  ProfileImageStack(
                    image: _pickedImage != null
                        ? FileImage(_pickedImage!) as ImageProvider
                        : widget.profileEntity.image!.isNotEmpty
                        ? NetworkImage(widget.profileEntity.image!) as ImageProvider
                        : AssetImage(ImagePaths().profile),
                    profileEntity: widget.profileEntity,
                    child: const CircleAvatar(
                      backgroundColor: Color(0xff35C2C1),
                      radius: 10.5,
                      child: Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    onTap: () async {
                      final pickedImage = await profileCubit.pickImage();
                      if (pickedImage != null) {
                        setState(() {
                          profileCubit.pickedImg = pickedImage;
                          _pickedImage = pickedImage;
                        });
                      }
                    },
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
                          labelText:
                              'Full Name',
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
                          labelText: 'Position',
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
                          labelText:
                             'Phone Number',
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
                          labelText:'E-Mail',
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
                      fallback: (context) => Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 30.0.w,
                          height: 30.0.h,
                          child: CircularProgressIndicator(
                            strokeWidth: 3.0.r,
                            // valueColor: AlwaysStoppedAnimation<Color>(Colors.blue), // Set desired color
                          ),
                        ),
                      )
                      ,
                      builder: (context) {
                        return MyButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();

                              final profileCubit =
                                  BlocProvider.of<ProfileCubit>(context);
                              if (profileCubit.pickedImg != null) {
                                profileCubit.imageUrl =
                                    await profileCubit.uploadImageToFirebase(
                                        profileCubit.pickedImg!);
                              }

                              await BlocProvider.of<ProfileCubit>(context)
                                  .updateProfile(
                                fullName: fullName ??
                                    widget.profileEntity.fullName.toString(),
                                position: position ??
                                    widget.profileEntity.position.toString(),
                                phoneNum: phoneNum ??
                                    widget.profileEntity.phoneNum.toString(),
                                email: email ??
                                    widget.profileEntity.email.toString(),
                                image: profileCubit.imageUrl ??
                                    widget.profileEntity.image.toString(),
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
