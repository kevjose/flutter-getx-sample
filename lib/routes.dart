import 'package:facility_app/bindings/root_screen_binding.dart';
import 'package:facility_app/views/home_screen.dart';
import 'package:facility_app/views/login_screen.dart';
import 'package:facility_app/views/phone_login_screen.dart';
import 'package:facility_app/views/root_screen.dart';
import 'package:get/get.dart';

final List<GetPage> appPages = [
  GetPage(
    name: RootScreen.routeName,
    page: () => RootScreen(),
    binding: RootScreenBinding(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: PhoneLoginScreen.routeName,
    page: () => PhoneLoginScreen(),
  ),
];
