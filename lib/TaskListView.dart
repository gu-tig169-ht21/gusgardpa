import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';
import 'AddTaskView.dart';
import 'TaskList.dart';

class TaskListView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('TODO List')),
        body: Consumer<MyState>(
            builder: (context, state, child) => TaskList(state.list)),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            var newTask = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTaskView(
                        Task(taskName: 'Nothing', color: Colors.grey))));
            if (newTask != null) {
              Provider.of<MyState>(context, listen: false).addTask(newTask);
            }
          },
        ));
  }
}
