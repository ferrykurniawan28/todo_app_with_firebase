import 'package:get/get.dart';
import 'package:todo/auth.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}
