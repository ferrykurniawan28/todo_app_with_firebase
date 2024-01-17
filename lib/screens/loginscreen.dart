import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/auth.dart';

class Login extends GetView<AuthController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Obx(() {
                    if (!controller.login.value) {
                      return Column(
                        children: [
                          TextFormField(
                            controller: controller.usernameController,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                borderSide: BorderSide(
                                    // color: Colors.red,
                                    ),
                              ),
                              labelText: 'Username',
                              hintText: 'Enter your username',
                            ),
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        borderSide: BorderSide(
                            // color: Colors.red,
                            ),
                      ),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        borderSide: BorderSide(
                            // color: Colors.red,
                            ),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account?'),
                      TextButton(
                        onPressed: controller.changeLogin,
                        child: Obx(
                          () => Text(
                            controller.login.value ? 'Register' : 'Login',
                            style: const TextStyle(
                              color: Colors.blue,
                              // decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: controller.submit,
                    child: Obx(() {
                      if (controller.login.value) {
                        return const Text('Login');
                      }
                      return const Text('Register');
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
