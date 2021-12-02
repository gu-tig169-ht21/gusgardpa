class Task {
  String id;
  String taskName;
  bool isComplete;

  Task({required this.id, required this.taskName, this.isComplete = false});

  static Map<String, dynamic> toJson(Task task) {
    return {
      'title': task.taskName,
      'done': task.isComplete,
    };
  }

  static Task fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      taskName: json['title'],
      isComplete: json['done'],
    );
  }
}
