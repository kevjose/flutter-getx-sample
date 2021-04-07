import 'package:facility_app/helpers/helpers.dart';
import 'package:facility_app/services/auth_service.dart';
import 'package:facility_app/views/root_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();
  String verificationIdCtrl;
  int codeCtrl;
  var loading = false.obs;
  var verificationCodeSent = false.obs;
  var loginType = 'EMAIL'.obs;

  final AuthService _authService = AuthService();

  User get user => _firebaseUser.value;
  User setUser(User user) => _firebaseUser.value = user;

  @override
  onInit() {
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
    } finally {
      loginType.value = 'EMAIL';
    }
  }

  // Phone verification
  void verificationCompleted(AuthCredential phoneAuthCredential) {}

  void verificationFailed(FirebaseAuthException error) {}

  void codeSent(String verificationId, int code) {
    verificationIdCtrl = verificationId;
    codeCtrl = code;
    print('_verificationId: $verificationIdCtrl');
    print('_code: $codeCtrl');
    loading.value = false;
    verificationCodeSent.value = true;
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
    }
  }

  Future<void> loginWithPhone(String smsCode) async {
    try {
      loading.value = true;
      final _verificationId = verificationIdCtrl;

      print('verificationIdCtrl: $_verificationId');
      AuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationId, smsCode: smsCode.trim());
      UserCredential _authResultPhone =
          await _firebaseAuth.signInWithCredential(credential);

      if (_authResultPhone != null && _authResultPhone.user != null) {
        var token = await _firebaseAuth.currentUser.getIdToken();
        print('token: $token');
        setUser(_firebaseAuth.currentUser);
      }
    } catch (e) {
      Helpers.showSnackbar(title: 'Error', message: e.message);
    } finally {
      verificationCodeSent.value = false;
      loading.value = false;
    }
  }
}
