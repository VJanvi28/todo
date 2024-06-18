import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'todo.dart';

class TodoService with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<Todo>> get todos {
    return _db.collection('todos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Todo.fromMap(doc.data(), doc.id);
      }).toList();
    });
  }

  Future<void> addTodo(String task) async {
    final newTodo = Todo(
      id: '',
      task: task,
    );
    await _db.collection('todos').add(newTodo.toMap());
  }

  Future<void> removeTodo(String id) async {
    await _db.collection('todos').doc(id).delete();
  }
}
