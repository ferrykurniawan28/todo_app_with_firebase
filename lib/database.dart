import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:todo/models.dart';

class Database extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<void> createAccount({
    required String uid,
    required String username,
    required String email,
  }) async {
    await _db.collection('users').doc(uid).set({
      'username': username,
      'email': email,
    });
  }

  // Future<QuerySnapshot<Map<String, dynamic>>> streamToDo() async {
  //   final data = await _db.collection('users').doc().collection('todos').get();
  //   return data;
  // }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamToDo(String uid) {
    return _db
        .collection('users')
        .doc(uid)
        .collection('todos')
        // .orderBy('date', descending: true)
        .where('done', isEqualTo: false)
        .snapshots();
  }

  Future<String?> getUsername(String uid) async {
    final data = await _db.collection('users').doc(uid).get();
    final username = data['username'] ?? '';
    return username;
  }

  Future<void> createTodo(ToDoItem todo, String uid) async {
    // ToDoItem todo = ToDoItem(title, false, description, date, priority);
    await _db.collection('users').doc(uid).collection('todos').add({
      'title': todo.title,
      'done': todo.done,
      'description': todo.description,
      'date': todo.date,
      'priority': todo.priority,
    });
  }

  Future<void> done(String id, String uid) async {
    await _db
        .collection('users')
        .doc(uid)
        .collection('todos')
        .doc(id)
        .update({'done': true});
  }

  // Future<int> countTodos(String uid) {
  //   final data = _db
  //       .collection('users')
  //       .doc(uid)
  //       .collection('todos')
  //       .where('done', isEqualTo: false)
  //       .snapshots();
  //   return data.length;
  //   // return data.;
  // }
  Future<int> countTodos(String uid) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection('users')
        .doc(uid)
        .collection('todos')
        .where('done', isEqualTo: false)
        .get();

    return snapshot.size;
  }

  Future<int> countDone(String uid) async {
    QuerySnapshot<Map<String, dynamic>> data = await _db
        .collection('users')
        .doc(uid)
        .collection('todos')
        .where('done', isEqualTo: true)
        .get();
    return data.size;
    // return data.size;
  }
}
