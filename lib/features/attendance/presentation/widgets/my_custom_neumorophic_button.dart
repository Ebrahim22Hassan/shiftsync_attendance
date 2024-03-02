import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:shiftsync_attendance/features/attendance/presentation/cubit/map_cubit.dart';
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
    MapCubit cubit = MapCubit.get(context);

    return GestureDetector(
      onTap: () {
        print("ButtonIsPressed");
        _handleTap(context);
      },
      child: AttendanceButtonUI(animation: _animation, cubit: cubit),
    );
  }

  void _handleTap(BuildContext context) {
    final cubit = MapCubit.get(context);
    if (cubit.locationStatus) {
      cubit.isCheckedIn
          ? _animationController.reverse()
          : _animationController.forward();
      _showBiometricDialog(context, cubit);
    } else {
      _animationController.forward();
      Future.delayed(const Duration(seconds: 1), () {
        cubit.showToastMessage("You are not in the location, اسلك");
        _animationController.reverse();
      });
    }
  }

  void _showBiometricDialog(BuildContext context, MapCubit cubit) {
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
      print("NOT=====SUPPORTED");
      cubit.isCheckedIn
          ? cubit.employeeCheckOutRecord(widget.profileEntity.id)
          : cubit.employeeCheckInRecord(widget.profileEntity.id);
      cubit.changeCheckInOutStatus();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
