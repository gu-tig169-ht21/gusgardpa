import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';
import './task_api.dart';

class TaskList extends StatelessWidget {
  final List<Task> list;

  TaskList(this.list);
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: list.map((task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, task) {
    return ListTile(
        leading: Checkbox(
            value: task.isComplete,
            onChanged: (bool? value) {
              Provider.of<MyState>(context, listen: false)
                  .updateTask(task, value);
            }),
        title: Text(task.taskName,
            style: (TextStyle(
                decoration:
                    task.isComplete ? TextDecoration.lineThrough : null))),
        trailing: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              var state = Provider.of<MyState>(context, listen: false);
              state.removeTask(task);
            }));
  }
}
