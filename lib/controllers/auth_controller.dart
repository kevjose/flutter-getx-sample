import 'package:facility_app/helpers/helpers.dart';
import 'package:facility_app/services/auth_service.dart';
import 'package:facility_app/views/root_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  // var _phoneAuthCredential = Rxn<AuthCredential>();
  var verificationIdCtrl = Rxn<String>();
  var codeCtrl = Rxn<int>();
  var loading = false.obs;

  final AuthService _authService = AuthService();

  User get user => _firebaseUser.value;
  User setUser(User user) => _firebaseUser.value = user;

  @override
  onInit() {
    // print('current ${_firebaseAuth.currentUser}');
    _firebaseUser.bindStream(_firebaseAuth.authStateChanges());
    // _firebaseAuth.signOut();
    super.onInit();
  }

  Future<void> login(String email, String password) async {
    try {
      loading.value = true;
      UserCredential _authResult = await _authService.loginUser(
        email.trim(),
        password.trim(),
      );
      if (_authResult != null && _authResult.user != null) {
        var token = await _firebaseAuth.currentUser.getIdToken();
        print('token: $token');
        setUser(_firebaseAuth.currentUser);
      }
    } catch (e) {
      Helpers.showSnackbar(title: 'Error', message: e.message);
    } finally {
      loading.value = false;
    }
  }

  void signOutUser() async {
    try {
      await _authService.signOutUser();
      Get.offAllNamed(RootScreen.routeName);
    } catch (e) {
      Helpers.showSnackbar(title: 'Error', message: e.message);
    }
  }

  // Phone verification
  void verificationCompleted(AuthCredential phoneAuthCredential) {}

  void verificationFailed(FirebaseAuthException error) {}

  void codeSent(String verificationId, int code) {
    verificationIdCtrl = Rxn<String>(verificationId);
    codeCtrl = Rxn<int>(code);
    print('_verificationId: $verificationIdCtrl');
    print('_code: $codeCtrl');
    submitOTP('000000');
  }

  void codeAutoRetrievalTimeout(String verificationId) {}

  Future<void> submitPhoneNumber(String phoneNumber) async {
    try {
      loading.value = true;
      print('submitPhoneNumber: $phoneNumber');
      await _authService.submitPhoneNumber(
        phoneNumber,
        verificationCompleted,
        verificationFailed,
        codeSent,
        codeAutoRetrievalTimeout,
      );
    } catch (error) {
      print('submitPhoneNumber: $error');
    } finally {
      loading.value = false;
    }
  }

  void submitOTP(smsCode) {
    loginWithPhone();
  }

  Future<void> loginWithPhone() async {
    try {
      final _verificationId = verificationIdCtrl.toString();

      print('verificationIdCtrl: $_verificationId');
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: '000000');
      print('credential: $credential');
      UserCredential _authResultPhone =
          await _firebaseAuth.signInWithCredential(credential);
      print('_authResultPhone: $_authResultPhone');
      // _firebaseUser = Rxn<User>(authRes.user);
      // print(_firebaseUser);

      print('Something');
    } catch (e) {
      print(e);
    }
  }
}
