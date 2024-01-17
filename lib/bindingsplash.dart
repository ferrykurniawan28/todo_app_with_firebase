import 'package:get/get.dart';
import 'package:todo/splash.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
