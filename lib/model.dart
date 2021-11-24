import 'package:flutter/material.dart';

class Task {
  String taskName;
  bool isComplete;

  Task({required this.taskName, this.isComplete = false});
}

class MyState extends ChangeNotifier {
  final List<Task> _list = [];
  int _filter = 0;

  List<Task> get list => _list;
  int get filterBy => _filter;

  void addTask(Task taskName) {
    _list.add(taskName);
    notifyListeners();
  }

  void updateTask(Task task, value) {
    task.isComplete = value;
    notifyListeners();
  }

  void filter(int filter) {
    _filter = filter;
    notifyListeners();
  }

  void removeTask(Task task) {
    _list.remove(task);
    notifyListeners();
  }
}
