import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';

class AddTaskView extends StatelessWidget {
  String text = '';
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Add Task')),
        body: SingleChildScrollView(
            child: Column(children: [
          TextField(
              controller: textEditingController,
              decoration: const InputDecoration(
                  hintText: 'Enter the name of the task')),
          TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                text = textEditingController.text;
                Provider.of<MyState>(context, listen: false)
                    .addTask(Task(id: '', taskName: text));
                textEditingController.clear();
              },
              child: const Text(
                '+ADD',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ))
          //  _button()
        ])));
  }

  /*Widget _button() {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        ),
        onPressed: () {
          text = textEditingController.text;
          Provider.of<MyState>(context, listen: false)
              .addTask(Task(taskName: text));
          textEditingController.clear();
        },
        child: const Text(
          '+ADD',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ));
  }*/
}
