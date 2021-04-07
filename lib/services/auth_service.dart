import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> loginUser(String email, String password) async {
    UserCredential _authResult = await _firebaseAuth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return (_authResult);
  }

  Future<void> signOutUser() async {
    await _firebaseAuth.signOut();
  }

  Future<void> submitPhoneNumber(phoneNumber, verificationCompleted,
      verificationFailed, codeSent, codeAutoRetrievalTimeout) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      /// Make sure to prefix with your country code
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 20),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    ); //
  }
}
