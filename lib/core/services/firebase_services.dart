import 'package:firebase_auth/firebase_auth.dart';

class FireBaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  verifyPhone(String phoneNumber) async {
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (value) {},
      verificationFailed: (value) {},
      codeSent: (value, intvalue) {},
      codeAutoRetrievalTimeout: (value) {},
    );
  }
}
