import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/home_cubit.dart';
import 'package:shiftsync_attendance/core/services/biometric_services.dart';
import 'package:shiftsync_attendance/features/profile/domain/entities/profile_entities.dart';
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
    biometricServices.localAuthentication
        .isDeviceSupported()
        .then((bool isSupport) => setState(() {
              biometricServices.supportState =
                  isSupport ? SupportState.supported : SupportState.unSupported;
            }));
    biometricServices.checkBiometric();
    biometricServices.getAvailableBiometrics((fn) {
      setState(() {});
    }, mounted);

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1), // Animation duration of 2 seconds
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.get(context);

    return GestureDetector(
      onTap: () {
        _handleTap(context);
      },
      child: AttendanceButtonUI(animation: _animation, cubit: cubit),
    );
  }

  void _handleTap(BuildContext context) {
    final cubit = HomeCubit.get(context);
    if(cubit.timeUp){
      cubit.showToastMessage(
        "روح يا شيبة"
      );
    }
    else{
      if (cubit.locationStatus) {
        if(cubit.isCheckedIn){
          print ("${cubit.isCheckedIn}");
          _showCheckOutAlertDialog(context, cubit);
          cubit.changeCheckInOutStatus();

        }else{
          cubit.employeeCheckInRecord(widget.profileEntity.id);
          print ("${cubit.isCheckedIn}");
          cubit.changeCheckInOutStatus();
          _animationController.forward();

        }

      } else {
        _animationController.forward();
        Future.delayed(const Duration(seconds: 1), () {
          cubit.showToastMessage("You are not in the location, اسلك");
          _animationController.reverse();
        });
      }
    }
  }

  void _showBiometricDialog(BuildContext context, HomeCubit cubit) {
    if (biometricServices.supportState == SupportState.supported) {
      print("SUPPORTED");
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

      if (cubit.isCheckedIn){
        _showCheckOutAlertDialog(context,cubit);
      }
      else{
      }

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
          title: const Text("Confirm Check Out"),
          content: const Text("Are you sure you want to check out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                cubit.employeeCheckOutRecord(widget.profileEntity.id);
              },
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }
}
