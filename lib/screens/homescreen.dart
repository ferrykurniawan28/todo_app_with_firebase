import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/home.dart';
import 'package:todo/models.dart';
import 'package:todo/routesname.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          // IconButton(
          //   onPressed: controller.logout,
          //   icon: const Icon(Icons.logout),
          // ),
          IconButton(
            onPressed: () {
              Get.toNamed(PagesName.profile);
            },
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.showmodal,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.streamTodos(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            List<ToDoItem> todos = snapshot.data!.docs.map((e) {
              return ToDoItem(
                e['title'],
                e['done'],
                e['description'],
                e['date'].toDate(),
                e['priority'],
              );
            }).toList();
            // return Container();
            todos.sort((a, b) => a.date.compareTo(b.date));

            return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                // Map<String, dynamic> data =
                //     snapshot.data.docs[index].data() as Map<String, dynamic>;
                return Dismissible(
                  key: Key(todos[index].title),
                  // key: Key(snapshot.data.docs[index].id),
                  onDismissed: (direction) {
                    controller.done(snapshot.data!.docs[index].id);
                    // controller.done(todos[index].title);
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        // title: Text(todos['title']),
                        title: Text(todos[index].title),
                        // subtitle: Text(data['description']),
                        subtitle: Text(todos[index].description),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Text(data['priority']),
                              Text(todos[index].priority),
                              const SizedBox(width: 10),
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color:
                                      // controller.priorityList[data['priority']],
                                      controller
                                          .priorityList[todos[index].priority],
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('No Todo Yet!'),
            );
          }
        },
      ),
    );
  }
}
