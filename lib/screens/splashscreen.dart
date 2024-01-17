import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/splash.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      controller.checkLogin();
    });
    return const Scaffold(
      body: Center(
        child: Text(
          'ToDo App',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
