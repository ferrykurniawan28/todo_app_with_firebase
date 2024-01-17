import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/database.dart';
import 'package:todo/routesname.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  RxBool login = true.obs;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? username;

  final _dbC = Get.put(Database());

  void changeLogin() {
    login.value = !login.value;
  }

  String uid() {
    return _auth.currentUser!.uid;
  }

  bool islogin() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  void loginEmail() async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        username = await _dbC.getUsername(uid());
        Get.snackbar(
          'Login Success',
          'Welcome $username',
          // snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(PagesName.home);
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Login Failed',
          e.message!,
          // snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void registerEmail() async {
    if (formKey.currentState!.validate()) {
      try {
        await _auth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await _dbC.createAccount(
          uid: uid(),
          username: usernameController.text,
          email: emailController.text,
        );
        username = await _dbC.getUsername(uid());
        Get.snackbar(
          'Register Success',
          'Welcome $username',
          // snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAllNamed(PagesName.home);
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Register Failed',
          e.message!,
          // snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void logout() async {
    await _auth.signOut();
  }

  void submit() {
    if (login.value) {
      loginEmail();
    } else {
      registerEmail();
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
