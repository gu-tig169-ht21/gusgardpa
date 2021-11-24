import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './task_list_view.dart';
import 'model.dart';

void main() {
  var state = MyState();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: TaskListView(),
    );
  }
}
