import 'package:get/get.dart';
import 'package:todo/profile.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
