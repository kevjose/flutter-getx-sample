import 'package:facility_app/controllers/controllers.dart';
import 'package:facility_app/views/home_screen.dart';
import 'package:facility_app/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends StatelessWidget {
  static const routeName = 'root_screen';
  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (authController) {
        print(authController.user);
        if (authController.user?.uid != null) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
