import 'package:facility_app/controllers/controllers.dart';
import 'package:get/get.dart';

class RootScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
