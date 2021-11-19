import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './TaskListView.dart';
import 'model.dart';

void main() {
  var state = MyState();

  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: TaskListView(),
    );
  }
}
