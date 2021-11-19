import 'package:flutter/material.dart';

import './model.dart';
import './TaskWidget.dart';

class AddTaskView extends StatefulWidget {
  final Task task;

  AddTaskView(this.task);

  @override
  State<StatefulWidget> createState() {
    return AddTaskViewState(task);
  }
}

class AddTaskViewState extends State<AddTaskView> {
  late String taskName;

  late TextEditingController textEditingController;

  AddTaskViewState(Task task) {
    this.taskName = task.taskName;

    textEditingController = TextEditingController(text: task.taskName);

    textEditingController.addListener(() {
      setState(() {
        taskName = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Add Task')),
        body: SingleChildScrollView(
            child: Column(children: [
          TaskWidget(Task(taskName: this.taskName, color: Colors.grey)),
          TextField(
            controller: textEditingController,
          ),
          _button()
        ])));
  }

  Widget _button() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        onPressed: () {
          Navigator.pop(context, Task(taskName: taskName, color: Colors.grey));
        },
        child: const Text(
          '+ ADD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }
}
