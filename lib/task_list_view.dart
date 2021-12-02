import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './model.dart';
import './add_task_view.dart';
import './task_list.dart';
import './task_api.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('TODO List'), actions: [
          PopupMenuButton<int>(
              icon: const Icon(Icons.menu, color: Colors.white),
              onSelected: (value) {
                Provider.of<MyState>(context, listen: false).filter(value);
              },
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text('All'), value: 0),
                    const PopupMenuItem(child: Text('Complete'), value: 1),
                    const PopupMenuItem(child: Text('Incomplete'), value: 2),
                  ]),
        ]),
        body: Consumer<MyState>(
            builder: (context, state, child) =>
                TaskList(_filter(state.list, state.filterBy))),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTaskView()));
            }));
  }

  List<Task> _filter(list, filterBy) {
    if (filterBy == 0) return list;
    if (filterBy == 1) {
      return list.where((task) => task.isComplete == true).toList();
    }
    if (filterBy == 2) {
      return list.where((task) => task.isComplete == false).toList();
    }
    return list;
  }
}
