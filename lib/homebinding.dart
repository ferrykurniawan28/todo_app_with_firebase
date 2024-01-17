import 'package:get/get.dart';
import 'package:todo/auth.dart';
import 'package:todo/database.dart';
import 'package:todo/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => AuthController());
    Get.put(Database());
  }
}
