import 'package:get/get.dart';
import 'package:todo/routesname.dart';

import 'auth.dart';

class SplashController extends GetxController {
  RxBool isLoggedIn = false.obs;

  final _auth = Get.put(AuthController());

  @override
  void onInit() {
    isLoggedIn.value = _auth.islogin();
    super.onInit();
  }

  void checkLogin() {
    if (isLoggedIn.value) {
      Get.offAllNamed(PagesName.home);
    } else {
      Get.offAllNamed(PagesName.login);
    }
  }
}
