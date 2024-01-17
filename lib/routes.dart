import 'package:get/get.dart';
import 'package:todo/bindinglogin.dart';
import 'package:todo/bindingsplash.dart';
import 'package:todo/homebinding.dart';
import 'package:todo/profilebinding.dart';
import 'package:todo/routesname.dart';
import 'package:todo/screens/homescreen.dart';
import 'package:todo/screens/loginscreen.dart';
import 'package:todo/screens/profilscreen.dart';
import 'package:todo/screens/splashscreen.dart';

class Routes {
  static final pages = [
    GetPage(
      name: PagesName.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: PagesName.login,
      page: () => const Login(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: PagesName.home,
      page: () => const Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: PagesName.profile,
      page: () => const ProfileScreen(),
      binding: ProfileBinding(),
    ),
  ];
}
