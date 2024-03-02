import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
enum SupportState{
  unknown, supported , unSupported
}
class BiometricServices {
  final LocalAuthentication localAuthentication = LocalAuthentication();
  SupportState supportState = SupportState.unknown;
  List<BiometricType>? availableBiometrics;

  Future<void> checkBiometric() async {
    late bool canCheckBiometric;
    try {
      canCheckBiometric = await localAuthentication.canCheckBiometrics;
      print("Supported: $canCheckBiometric");
    } on PlatformException catch (e) {
      print(e);
      canCheckBiometric = false;
    }
  }

  Future<void> getAvailableBiometrics(void Function(void Function() fn) setState, bool mounted) async {
    late List<BiometricType> biometricTypes;
    try {
      biometricTypes = await localAuthentication.getAvailableBiometrics();
      print("Supported: $biometricTypes");
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) {
      return;
    }
    setState(() {
      availableBiometrics = biometricTypes;
    });
  }

  Future<void> authenticateWithBiometrics(bool mounted, void Function() performFunction) async {
    try {
      final authenticated = await localAuthentication.authenticate(
          localizedReason: 'Auth with Fingerprint or FaceID',
          options: const AuthenticationOptions(
              stickyAuth: true, biometricOnly: true));
      if (!mounted) {
        return;
      }
      if (authenticated) {
        print("autheticated");
        performFunction();
      } else {
        print("Not Authitecated");
      }
    } on PlatformException catch (e) {
      print(e);
      return;
    }
  }
}
