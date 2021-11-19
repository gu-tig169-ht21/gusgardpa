import 'package:flutter/material.dart';

import './model.dart';

class TaskWidget extends StatelessWidget {
  final Task task;

  TaskWidget(this.task);

  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(color: task.color),
        child: Align(alignment: Alignment.center, child: Text(task.taskName)));
  }
}
