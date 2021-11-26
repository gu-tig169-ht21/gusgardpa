import 'package:flutter/material.dart';

import 'task_api.dart';

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

class MyState extends ChangeNotifier {
  List<Task> _list = [];
  int _filter = 0;

  List<Task> get list => _list;
  int get filterBy => _filter;

  Future getList() async {
    List<Task> list = await TaskAPI.itemList();
    _list = list;
    notifyListeners();
  }

  void addTask(Task task) async {
    _list = await TaskAPI.addItem(task);
    notifyListeners();
  }

  void updateTask(Task task, value) async {
    task.isComplete = value;
    _list = await TaskAPI.updateItem(task.id, task);
    notifyListeners();
  }

  void removeTask(Task task) async {
    _list = await TaskAPI.removeItem(task.id);
    notifyListeners();
  }

  void filter(int filter) {
    _filter = filter;
    notifyListeners();
  }
}
