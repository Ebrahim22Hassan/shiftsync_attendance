import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthRemoteDataSource {
  Future<User?> registerWithEmailAndPassword({
    required String fullName,
    required String phone,
    required String gender,
    required String position,
    required String email,
    required String password,
  });

  Future<User?> loginWithEmailAndPassword(String email, String password);

  Future<void> logout();

  Future<void> forgetPassword(String email); // Add this method
  Future<void> resetPassword(
      String email, String newPassword, String code); // Add this method
  Future<void> setNewPassword(
      String oldPassword, String newPassword); // Add this method
  Future<void> deleteAccount(); // Add this method
  Future<void> sendOtp(String phoneNumber); // Add this method
  Future<void> verifyOtp(String otp); // Add this method
  Future<void> resendOtp(String phoneNumber);
}

class FirebaseAuthRemoteDataSourceImpl implements FirebaseAuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthRemoteDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> registerWithEmailAndPassword({
    required String fullName,
    required String phone,
    required String gender,
    required String position,
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Additional logic to store user information in your database if needed

      return userCredential.user;
    } catch (e) {
      // Handle registration failure, e.g., email already in use
      print('Error during registration: $e');
      return null;
    }
  }

  @override
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user-not-found');
      } else if (e.code == 'wrong-password') {
        print('wrong-password');
      }
    }
    print("Not VALID");
    return null;

    // catch (e) {
    //   // Handle login failure, e.g., invalid credentials
    //   print('Error during login: $e');
    //   return null;
    // }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      // Handle logout failure
      print('Error during logout: $e');
      rethrow; // You can throw an exception or handle it according to your app's logic
    }
  }

  @override
  Future<void> forgetPassword(String email) async {
    // ... (implementation)
  }

  @override
  Future<void> resetPassword(
      String email, String newPassword, String code) async {
    // ... (implementation)
  }

  @override
  Future<void> setNewPassword(String oldPassword, String newPassword) async {
    // ... (implementation)
  }

  @override
  Future<void> deleteAccount() async {
    // ... (implementation)
  }

  @override
  Future<void> sendOtp(String phoneNumber) async {
    // ... (implementation)
  }

  @override
  Future<void> verifyOtp(String otp) async {
    // ... (implementation)
  }

  @override
  Future<void> resendOtp(String phoneNumber) async {
    // ... (implementation)
  }
}
