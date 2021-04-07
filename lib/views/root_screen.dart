import 'package:facility_app/controllers/controllers.dart';
import 'package:facility_app/views/home_screen.dart';
import 'package:facility_app/views/login_screen.dart';
import 'package:facility_app/views/phone_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  static const routeName = 'root_screen';
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (authController) {
        print('Root builder called ${authController.user?.uid}');
        if (authController.user?.uid != null) {
          print('returning home');
          return HomeScreen();
        } else {
          print('returning login');
          return authController.loginType.value == 'EMAIL'
              ? LoginScreen()
              : PhoneLoginScreen();
        }
      },
    );
  }
}
