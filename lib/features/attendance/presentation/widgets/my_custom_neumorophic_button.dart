import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_cubit.dart';
import 'package:shiftsync_attendance/core/services/biometric_services.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
import '../../../../const.dart';
import '../../../../core/services/applocal.dart';
import 'attendance_button_ui.dart';
import 'biometric_dialog.dart';

class MyCustomNeumorphicButton extends StatefulWidget {
  final ProfileEntity profileEntity;

  const MyCustomNeumorphicButton({super.key, required this.profileEntity});

  @override
  State<MyCustomNeumorphicButton> createState() =>
      _MyCustomNeumorphicButtonState();
}

class _MyCustomNeumorphicButtonState extends State<MyCustomNeumorphicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  BiometricServices biometricServices = BiometricServices();

  @override
  void initState() {
    super.initState();

    // biometricServices.localAuthentication
    //     .isDeviceSupported()
    //     .then((bool isSupport) => setState(() {
    //   biometricServices.supportState =
    //   isSupport ? SupportState.supported : SupportState.unSupported;
    // }));
    // biometricServices.checkBiometric();
    // biometricServices.getAvailableBiometrics((fn) {
    //   setState(() {});
    // }, mounted);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        Tween<double>(begin: beginningOfProgressDegree, end: endOfProgressDegree).animate(_animationController);
    _animationController.addListener(() {
      setState(() {
        beginningOfProgressDegree = _animation.value ;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);


    return GestureDetector(
      onTap: () {
        _handleTap(context);
      },
      child: AttendanceButtonUI(
        animation: _animation,
        cubit: cubit,
        animationController: _animationController,
      ),
    );
  }

  void _handleTap(BuildContext context) {
    final cubit = HomeCubit.get(context);
    if (cubit.timeUp) {
      cubit.showToastMessage("Have a nice day");
    } else {
      if (cubit.locationStatus) {
        if (cubit.isCheckedIn) {
          _showCheckOutAlertDialog(context, cubit);
        } else {
          cubit.employeeCheckInRecord(widget.profileEntity.id);
          cubit.changeCheckInOutStatus();
          _animationController.forward();

        }
      } else {
        _animationController.forward();
        Future.delayed(const Duration(seconds: 1), () {
          cubit.showToastMessage("You are not in the right location");
          _animationController.reverse();
        });
      }
    }
  }

  void _showBiometricDialog(BuildContext context, HomeCubit cubit) {
    if (biometricServices.supportState == SupportState.supported) {
      Future.delayed(const Duration(seconds: 2), () {
        showDialog(
          context: context,
          builder: (context) {
            return BiometricDialog(
              onActionPressed: () async {
                Navigator.of(context).pop();
                await biometricServices.authenticateWithBiometrics(
                  mounted,
                      () {
                    cubit.isCheckedIn
                        ? cubit.employeeCheckOutRecord(widget.profileEntity.id)
                        : cubit.employeeCheckInRecord(widget.profileEntity.id);
                  },
                );
                cubit.changeCheckInOutStatus();
              },
            );
          },
        );
      });
    } else {
      if (cubit.isCheckedIn) {
        _showCheckOutAlertDialog(context, cubit);
      } else {}

      cubit.changeCheckInOutStatus();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showCheckOutAlertDialog(BuildContext context, HomeCubit cubit) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            getLang(context, "confirmCheckOut"),
          ),
          content: Text(
            getLang(context, "checkOutMessage"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                cubit.changeCheckInOutStatus();
                cubit.employeeCheckOutRecord(widget.profileEntity.id);

              },
              child: Text(
                getLang(context, "yes"),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                getLang(context, "no"),
              ),
            ),
          ],
        );
      },
    );
  }
}
