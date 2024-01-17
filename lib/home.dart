import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/auth.dart';
import 'package:todo/database.dart';
import 'package:todo/models.dart';

class HomeController extends GetxController {
  //
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final today = DateTime.now();
  var priority = 'Low'.obs;

  Map<String, Color> priorityList = {
    'Low': Colors.green,
    'Medium': Colors.yellow,
    'High': Colors.red,
  };

  final _dbC = Get.put(Database());
  final _authC = Get.put(AuthController());

  void createTodo() async {
    if (formKey.currentState!.validate()) {
      try {
        ToDoItem todo = ToDoItem(
          titleController.text,
          false,
          descriptionController.text,
          today,
          priority.value,
        );
        await _dbC.createTodo(
          todo,
          _authC.uid(),
        );
        Get.back();
        reset();
        Get.snackbar(
          'Success',
          'Todo Created',
          // snackPosition: SnackPosition.BOTTOM,
        );
      } catch (e) {
        Get.snackbar(
          'Failed',
          e.toString(),
          // snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  void done(String id) async {
    try {
      await _dbC.done(id, _authC.uid());
      Get.snackbar(
        'Success',
        'Todo Done',
        // snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Failed',
        e.toString(),
        // snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void logout() {
    _authC.logout();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamTodos() {
    return _dbC.streamToDo(_authC.uid());
    // .where('done', isEqualTo: false)
    // .where('date', isGreaterThanOrEqualTo: today)
    // .snapshots();
  }

  void changePriority(String? value) {
    priority.value = value!;
  }

  void reset() {
    priority.value = 'Low';
    titleController.clear();
    descriptionController.clear();
  }

  void showmodal() {
    Get.bottomSheet(
      Container(
        height: 350,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create Todo',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Title cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Obx(
                      () => DropdownButton<String>(
                        items: [
                          for (var item in priorityList.keys)
                            DropdownMenuItem<String>(
                              value: item,
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    color: priorityList[item],
                                  ),
                                  const SizedBox(width: 10),
                                  Text(item),
                                ],
                              ),
                            ),
                          // for (var item in priorityList)
                          //   DropdownMenuItem<String>(
                          //     value: item,
                          //     child: Text(item),
                          //   ),
                        ],
                        value: priority.value,
                        onChanged: changePriority,
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: reset,
                      child: const Text('Reset'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: createTodo,
                  child: const Text('Create'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
