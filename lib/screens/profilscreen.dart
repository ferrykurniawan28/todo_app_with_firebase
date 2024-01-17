import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/profile.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String username = controller.username;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: controller.signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/4c/12/5d/4c125debf02097027abd289238260016.jpg'),
            ),
            const SizedBox(height: 20),
            Obx(
              () => Text(
                controller.username.value,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'incomplete',
                        style: TextStyle(fontSize: 20),
                      ),
                      Obx(
                        () => Text(
                          controller.incomplete.value.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'complete',
                        style: TextStyle(fontSize: 20),
                      ),
                      Obx(
                        () => Text(
                          controller.complete.value.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
