import 'package:get/get.dart';
import 'package:todo/auth.dart';
import 'package:todo/database.dart';

class ProfileController extends GetxController {
  var username = ''.obs;
  var incomplete = 0.obs;
  var complete = 0.obs;

  final _dbC = Get.put(Database());
  final _authC = Get.put(AuthController());

  @override
  void onInit() async {
    username.value = await _dbC.getUsername(_authC.uid()) ?? '';
    incomplete.value = await _dbC.countTodos(_authC.uid());
    complete.value = await _dbC.countDone(_authC.uid());
    // print(username);
    super.onInit();
  }

  void signOut() {
    try {
      _authC.logout();
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar(
        'Failed',
        e.toString(),
      );
    }
  }
}
