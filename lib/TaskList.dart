import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';

class TaskList extends StatelessWidget {
  final List<Task> list;

  TaskList(this.list);

  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, task) {
    return ListTile(
        leading: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(color: task.color)),
        title: Text(task.taskName),
        trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeTask(task);
            }));
  }
}
