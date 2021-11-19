import 'package:flutter/material.dart';

class Task {
  String taskName;
  Color color = Colors.blue;

  Task({required this.taskName, required this.color});
}

class MyState extends ChangeNotifier {
  late List<Task> _list = [];

  List<Task> get list => _list;

  void addTask(Task task) {
    _list.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _list.remove(task);
    notifyListeners();
  }
}
