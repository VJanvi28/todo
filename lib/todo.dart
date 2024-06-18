class Todo {
  final String id;
  final String task;

  Todo({
    required this.id,
    required this.task,
  });

  factory Todo.fromMap(Map<String, dynamic> data, String documentId) {
    return Todo(
      id: documentId,
      task: data['task'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'task': task,
    };
  }
}
