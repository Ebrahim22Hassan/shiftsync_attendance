import 'package:flutter/material.dart';

class BiometricDialog extends StatelessWidget {
  const BiometricDialog({super.key, this.onActionPressed});

  final void Function()? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Fingerprint Required"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/fingerprint.png',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const Text(
              "To complete your attendance, the app requires your fingerprint for security verification.")
        ],
      ),
      actions: [
        ElevatedButton(
            onPressed: onActionPressed,
                //() async {
              // Navigator.of(context).pop();
              // await biometricServices
              //     .authenticateWithBiometrics(mounted, () {
              //   if (cubit.isCheckedIn) {
              //     cubit.employeeCheckOutRecord();
              //   } else {
              //     cubit.employeeCheckInRecord();
              //   }
              // });
              // setState(() {
              //   cubit.changeCheckInOutStatus();
              // }); // Update the UI after authentication
            //},
            child: const Text("OK"))
      ],
    );
  }
}
